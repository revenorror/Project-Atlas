#!/usr/bin/env python3

# Requires python 3.7 or newer

import argparse
import os
import sys
import re
import operator
from statistics import median_high
from functools import reduce
from fractions import Fraction
from subprocess import check_call, check_output
from typing import Optional


def generate_atlas(atlas_file: str, base_width_override: Optional[int]):
    ratios = {}
    commands = []
    with open(atlas_file, encoding="utf-8") as file:
        section = "ratios"
        for line in file.readlines():
            # Ignore comments
            if line.startswith("#"):
                continue
            if line.startswith("[ratios]"):
                # Just exists for readability
                continue
            if line.startswith("[commands]"):
                section = "commands"
                continue
            if section == "ratios" and "=" in line:
                texture_file, _, ratio = line.rpartition("=")
                ratios[texture_file.strip()] = Fraction(ratio.strip())
            elif section == "commands":
                if line.strip():
                    commands.append(line.strip())

    assert ratios, "There must be at least one texture file as input to the atlas"
    assert commands, "There must be at least one command to generate the atlas"

    # Determine Atlas base width, using the median texture size after adjusting for the ratios
    if base_width_override is not None:
        base_width = base_width_override
    else:
        outputs = check_output(
            ["magick", "convert"] + list(ratios) + ["-format", "%w ", "info:"],
            encoding="utf-8",
            text=True,
        ).split()
        ratio_values = list(ratios.values())
        sizes = [int(int(size) / ratio) for size, ratio in zip(outputs, ratio_values)]
        base_width = median_high(sizes)

    # Commands are merged into one magick convert call
    # (requires adding a '-write' before each output)
    # This also allows the use of mpr references between commands
    outputs = []
    combined_commands = []

    def arithmetic_sub(string: str) -> str:
        """
        Evaluates arithmetic patterns in the input

        They can include fractions and multiplication
        E.g. {2*1/2}, {width/2}, {10*width/2}
        """

        def inner(match):
            expr = match.group(0).strip("{}")
            expr = expr.replace("width", str(base_width))
            return str(reduce(operator.mul, map(Fraction, expr.split("*"))))

        return re.sub(r"{([0-9.]+|\*|width)+?}", inner, string)

    for command in commands:
        command = arithmetic_sub(command)
        new_command = []
        output = command.split()[-1]
        outputs.append(output)
        for word in command.split()[:-1]:
            if word.lower().endswith(".dds"):
                # Each input texture is resized so that textures being larger/smaller
                # than expected does not break the atlas
                width = base_width * ratios[word]
                new_command.extend(["(", word, "-resize", str(width), ")"])
            else:
                new_command.append(word)
        # Set compression for dds outputs
        # so that it doesn't have to be specified in the template
        if output.endswith(".dds"):
            new_command.extend(["-define", "dds:compreession=dxt1"])
        # Make sure parent directories of the output file exist
        if not output.startswith("mpr:"):
            os.makedirs(os.path.dirname(output), exist_ok=True)
        new_command.append("-write")
        new_command.append(output)
        combined_commands.extend(["("] + new_command + [")"])
    # null: is necessary since there is no final output. Each command has its own output.
    check_call(
        ["magick", "convert", "-respect-parentheses"] + combined_commands + ["null:"],
    )

    # Clean up temporary files
    for filename in outputs:
        if filename.endswith(".bmp"):
            os.remove(filename)


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("atlas_file", help="Atlas template file for processing")
    parser.add_argument(
        "--width",
        help="Width of the atlas. If omitted, will be detected from the input textures",
        type=int,
        nargs="?",
    )

    args = parser.parse_args(sys.argv[1:])
    generate_atlas(args.atlas_file, args.width)
