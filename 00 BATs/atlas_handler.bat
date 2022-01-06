@echo off
set run_without_pause=1
cls
:start
cls
@echo.
@echo.

:type
@echo  0 - Ashtree Atlas              1 - Azura's Coast Tree Atlas  2 - Azura Statue Atlas
@echo  3 - Barnacle Atlas             4 - Bloodmoon Cave Door Atlas 5 - Bloodmoon Colony Tileset Atlas
@echo  6 - Boethiah Statue Atlas      7 - Coins Atlas               8 - Common Tileset Atlas
@echo  9 - Dark Elf Furniture Atlas  10 - Doors Atlas              11 - Dragon Statue Atlas
@echo 12 - Emperor Parasol Atlas     13 - Fungus Atlas             14 - Hlaalu Tileset Atlas
@echo 15 - Imperial Tileset          16 - Kelp Atlas               17 - Limeware Atlas
@echo 18 - Mace of Molag Bal Atlas   19 - Malacath Statue Atlas    20 - Molag Bal Statue Atlas
@echo 21 - Mushroom Atlas            22 - Mushroom Only Atlas      23 - Nordic Tileset Atlas
@echo 24 - Redoran Atlas             25 - Redware Atlas            26 - Redware Pot Atlas
@echo 27 - Shack Atlas               28 - Sheogorath Statue Atlas  29 - Ship Atlas
@echo 30 - Silt Strider Atlas        31 - Silverware Atlas         32 - Sixth House Atlas
@echo 33 - Skeleton Atlas            34 - Urn Atlas                35 - Velothi Tileset Atlas
@echo 36 - Wood Docks Atlas          37 - Woodpoles Atlas          38 - Run All
@echo                                                              39 - Exit
set /p _input="What Patcher To Run? [0 - 39] " || set _input=0
set /a _inputeval="%_input%"*1
if %_inputEval% GTR 39 goto type
if %_inputEval% LSS 0 goto type

if %_inputEval% EQU 0 (
@echo Generating ashtree atlas.
call "_ashtree_atlas_generator.bat"
)
if %_inputEval% EQU 1 (
@echo Generating azura's coast tree atlas.
call "_ac_trees_atlas_generator.bat"
)
if %_inputEval% EQU 2 (
@echo Generating Azura statue atlas.
call "Separated Dae Stat BATs\_dae_stat_azura_atlas_generator.bat"
)
if %_inputEval% EQU 3 (
@echo Generating barnacle atlas.
call "_barnacle_atlas_generator.bat"
)
if %_inputEval% EQU 4 (
@echo Generating Bloodmoon cave door atlas.
call "_bm_cavedoor_atlas_generator.bat"
)
if %_inputEval% EQU 5 (
@echo Generating Bloodmoon colony tileset atlas.
call "_colony_atlas_generator.bat"
)
if %_inputEval% EQU 6 (
@echo Generating Boethiah statue atlas.
call "Separated Dae Stat BATs\_dae_stat_boe_atlas_generator.bat"
)
if %_inputEval% EQU 7 (
@echo Generating common tileset atlas.
call nordcommon_atlas_generator.bat
)
if %_inputEval% EQU 8 (
@echo Generating coins atlas.
call "_coins_atlas_generator.bat"
)
if %_inputEval% EQU 9 (
@echo Generating dark elf furniture atlas.
call "_furn_de_atlas_generator.bat"
)
if %_inputEval% EQU 10 (
@echo Generating doors atlas.
call "_doors_atlas_generator.bat"
)
if %_inputEval% EQU 11 (
@echo Generating dragon statue atlas.
call dragonstatue_atlas_generator.bat
)
if %_inputEval% EQU 12 (
@echo Generating emperor parasol atlas.
call emperor_parasol_atlas_generator.bat
)
if %_inputEval% EQU 13 (
@echo Generating fungus atlas.
call bc_fungus_atlas_generator.bat
)
if %_inputEval% EQU 14 (
@echo Generating hlaalu tileset atlas.
call hlaalu_atlas_generator.bat
)
if %_inputEval% EQU 15 (
@echo Generating imperial tileset atlas.
call imperial_atlas_generator.bat
)
if %_inputEval% EQU 16 (
@echo Generating kelp atlas.
call "_kelp_atlas_generator.bat"
)
if %_inputEval% EQU 17 (
@echo Generating limeware atlas.
call "_limeware_atlas_generator.bat"
)
if %_inputEval% EQU 18 (
@echo Generating mace of Molag Bal atlas.
call "_w_mace_molag_bal_atlas_generator.bat"
)
if %_inputEval% EQU 19 (
@echo Generating Malacath statue atlas.
call "Separated Dae Stat BATs\_dae_stat_malacath_atlas_generator.bat"
)
if %_inputEval% EQU 20 (
@echo Generating Molag Bal statue atlas.
call "Separated Dae Stat BATs\_dae_stat_molag_atlas_generator.bat"
)
if %_inputEval% EQU 21 (
@echo Generating mushrooms atlas.
call bc_mushrooms_atlas_generator.bat
)
if %_inputEval% EQU 22 (
@echo Generating mushrooms only atlas.
call bc_mushroom_only_atlas_generator.bat
)
if %_inputEval% EQU 23 (
@echo Generating nordic tileset atlas.
call nord_atlas_generator.bat
)
if %_inputEval% EQU 24 (
    @echo Generating redoran tileset atlas.
    if not exist "_redoran_atlas_generator.bat" (
        call redoran_atlas_generator.bat
    )
    if exist "_redoran_atlas_generator.bat" (
        call _redoran_atlas_generator.bat
    )
)
if %_inputEval% EQU 25 (
@echo Generating redware atlas.
call redware_atlas_generator.bat
)
if %_inputEval% EQU 26 (
@echo Generating redware pot atlas.
call redware_pot_atlas_generator.bat
)
if %_inputEval% EQU 27 (
@echo Generating shack atlas.
call "_shack_atlas_generator.bat"
)
if %_inputEval% EQU 28 (
@echo Generating Sheogorath statue atlas.
call "Separated Dae Stat BATs\_dae_stat_sheo_atlas_generator.bat"
)
if %_inputEval% EQU 29 (
@echo Generating ship atlas.
call "_ship_atlas_generator.bat"
)
if %_inputEval% EQU 30 (
@echo Generating silt strider atlas.
call "_silt_strider_atlas_generator.bat"
)
if %_inputEval% EQU 31 (
@echo Generating silverware atlas.
call "_silverware_atlas_generator.bat"
)
if %_inputEval% EQU 31 (
@echo Generating sixth house atlas.
call "_sixth_house_atlas_generator.bat"
)
if %_inputEval% EQU 33 (
@echo Generating skeleton atlas.
call "_skeleton_atlas_generator.bat"
)
if %_inputEval% EQU 34 (
@echo Generating urn atlas.
call urn_atlas_generator.bat
)
if %_inputEval% EQU 35 (
@echo Generating velothi tileset atlas.
call velothi_atlas_generator.bat
)
if %_inputEval% EQU 36 (
@echo Generating wood docks atlas.
call "_wood_docks_generator.bat"
)
if %_inputEval% EQU 37 (
    @echo Generating woodpoles atlas.
    if not exist "_woodpoles_atlas_generator.bat" (
        call woodpoles_atlas_generator.bat
    )
    if exist "_woodpoles_atlas_generator.bat" (
        call _woodpoles_atlas_generator.bat
    )
)
if %_inputEval% EQU 38 (
    @echo Starting to build all atlasses.
    if exist "_ashtree_atlas_generator.bat" (
        @echo Generating ashtree atlas.
        call "_ashtree_atlas_generator.bat"
    )
    if exist "_ac_trees_atlas_generator.bat" (
        @echo Generating azura's coast tree atlas.
        call "_ac_trees_atlas_generator.bat"
    )
    if exist "Separated Dae Stat BATs\_dae_stat_azura_atlas_generator.bat" (
        @echo Generating Azura statue atlas.
        call "Separated Dae Stat BATs\_dae_stat_azura_atlas_generator.bat"
    )
    if exist "_barnacle_atlas_generator.bat" (
        @echo Generating barnacle atlas.
        call "_barnacle_atlas_generator.bat"
    )
    if exist "_bm_cavedoor_atlas_generator.bat" (
        @echo Generating Bloodmoon cave door atlas.
        call "_bm_cavedoor_atlas_generator.bat"
    )

    if exist "_colony_atlas_generator.bat" (
        @echo Generating Bloodmoon colony tileset atlas.
        call "_colony_atlas_generator.bat"
    )
    if exist "Separated Dae Stat BATs\_dae_stat_boe_atlas_generator.bat" (
        @echo Generating Boethiah statue atlas.
        call "Separated Dae Stat BATs\_dae_stat_boe_atlas_generator.bat"
    )
    if exist "_coins_atlas_generator.bat" (
        @echo Generating coins atlas.
        call "_coins_atlas_generator.bat"
    )
    @echo Generating common tileset atlas.
    call nordcommon_atlas_generator.bat
    if exist "_furn_de_atlas_generator.bat" (
        @echo Generating dark elf furniture atlas.
        call "_furn_de_atlas_generator.bat"
    )
    if exist "_doors_atlas_generator.bat" (
        @echo Generating doors atlas.
        call "_doors_atlas_generator.bat"
    )
    @echo Generating dragon statue atlas.
    call dragonstatue_atlas_generator.bat
    @echo Generating emperor parasol atlas.
    call emperor_parasol_atlas_generator.bat
    @echo Generating fungus atlas.
    call bc_fungus_atlas_generator.bat
    @echo Generating hlaalu tileset atlas.
    call hlaalu_atlas_generator.bat
    @echo Generating imperial tileset atlas.
    call imperial_atlas_generator.bat
    if exist "_kelp_atlas_generator.bat" (
        @echo Generating kelp atlas.
        call "_kelp_atlas_generator.bat"
    )
    if exist "_limeware_atlas_generator.bat" (
        @echo Generating limeware atlas.
        call "_limeware_atlas_generator.bat"
    )
    if exist "_wood_docks_generator.bat" (
        @echo Generating mace of Molag Bal atlas.
        call "_w_mace_molag_bal_atlas_generator.bat"
    )
    if exist "Separated Dae Stat BATs\_dae_stat_malacath_atlas_generator.bat" (
        @echo Generating Malacath statue atlas.
        call "Separated Dae Stat BATs\_dae_stat_malacath_atlas_generator.bat"
    )
    if exist "Separated Dae Stat BATs\_dae_stat_molag_atlas_generator.bat" (
        @echo Generating Molag Bal statue atlas.
        call "Separated Dae Stat BATs\_dae_stat_molag_atlas_generator.bat"
    )
    @echo Generating mushrooms atlas.
    call bc_mushrooms_atlas_generator.bat
    @echo Generating mushrooms only atlas.
    call bc_mushroom_only_atlas_generator.bat
    @echo Generating nordic tileset atlas.
    call nord_atlas_generator.bat
    @echo Generating redoran tileset atlas.
    if not exist "_redoran_atlas_generator.bat" (
        call redoran_atlas_generator.bat
    )
    if exist "_redoran_atlas_generator.bat" (
        call _redoran_atlas_generator.bat
    )
    @echo Generating redware atlas.
    call redware_atlas_generator.bat
    @echo Generating redware pot atlas.
    call redware_pot_atlas_generator.bat
    if exist "_shack_atlas_generator.bat" (
        @echo Generating shack atlas.
        call "_shack_atlas_generator.bat"
    )
    if exist "Separated Dae Stat BATs\_dae_stat_sheo_atlas_generator.bat" (
        @echo Generating Sheogorath statue atlas.
        call "Separated Dae Stat BATs\_dae_stat_sheo_atlas_generator.bat"
    )
    if exist "_ship_atlas_generator.bat" (
        @echo Generating ship atlas.
        call "_ship_atlas_generator.bat"
    )
    if exist "_silt_strider_atlas_generator.bat" (
        @echo Generating silt strider atlas.
        call "_silt_strider_atlas_generator.bat"
    )
    if exist "_silverware_atlas_generator.bat" (
        @echo Generating silverware atlas.
        call "_silverware_atlas_generator.bat"
    )
    if exist "_skeleton_atlas_generator.bat" (
        @echo Generating skeleton atlas.
        call "_skeleton_atlas_generator.bat"
    )
    @echo Generating urn atlas.
    call urn_atlas_generator.bat
    @echo Generating velothi tileset atlas.
    call velothi_atlas_generator.bat
    if exist "_wood_docks_generator.bat" (
        @echo Generating wood docks atlas.
        call "_wood_docks_generator.bat"
    )
    @echo Generating woodpoles atlas.
    if not exist "_woodpoles_atlas_generator.bat" (
        call woodpoles_atlas_generator.bat
    )
    if exist "_woodpoles_atlas_generator.bat" (
        call _woodpoles_atlas_generator.bat
    )
    pause
)

if %_inputEval% EQU 39 (
goto end
)
goto start

:end
pause
exit