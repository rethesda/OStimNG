cmake_minimum_required(VERSION 3.21)
message("Using toolchain file ${CMAKE_TOOLCHAIN_FILE}.")


########################################################################################################################
## Define project
########################################################################################################################
project(
        OStim
        VERSION 7.3.5.3
        DESCRIPTION ""
        LANGUAGES CXX)
set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_INTERPROCEDURAL_OPTIMIZATION ON)

include(GNUInstallDirs)

configure_file(
        ${CMAKE_CURRENT_SOURCE_DIR}/cmake/version.rc.in
        ${CMAKE_CURRENT_BINARY_DIR}/version.rc
        @ONLY)

set(headers
        include/Header/Header.h)

set(sources
    src/ActorProperties/ActorPropertyTable.cpp
    src/Alignment/ActorKey.cpp
    src/Alignment/Alignments.cpp
    src/Alignment/ThreadKey.cpp
    src/Core/Core.cpp
    src/Core/EquipObjectHandler.cpp
    src/Core/ExpressionUpdater.cpp
    src/Core/Singleton.h
    src/Core/Thread/ThreadAutoControl.cpp
    src/Core/Thread/ThreadClimax.cpp
    src/Core/Thread/ThreadNavigation.cpp
    src/Core/Thread/ThreadSound.cpp
    src/Core/ThreadActor/ThreadActorAnimation.cpp
    src/Core/ThreadActor/ThreadActorClimax.cpp
    src/Core/ThreadActor/ThreadActorEquipObjects.cpp
    src/Core/ThreadActor/ThreadActorExcitement.cpp
    src/Core/ThreadActor/ThreadActorExpression.cpp
    src/Core/ThreadActor/ThreadActorSound.cpp
    src/Core/ThreadStarter/DebugNPCThreadStarter.cpp
    src/Core/ThreadStarter/NPCThreadStarter.cpp
    src/Core/ThreadStarter/PlayerThreadStarter.cpp
    src/Core/ThreadStarter/ThreadStarter.cpp
    src/Core/Thread.cpp
    src/Core/ThreadActor.cpp
    src/Core/ThreadInterface.cpp
    src/Core/ThreadManager.cpp
    src/Core/ThreadManager.h
    src/Events/EventListener.cpp
    src/Furniture/Furniture.cpp
    src/Furniture/FurnitureTable.cpp
    src/Furniture/FurnitureType.cpp
    src/Game/LocaleManager.cpp
	src/Game/LocaleManager.h
	src/Game/Locker.h
    src/GameAPI/Game.cpp
    src/GameAPI/GameActor.cpp
    src/GameAPI/GameArmor.cpp
    src/GameAPI/GameCamera.cpp
    src/GameAPI/GameDialogue.cpp
    src/GameAPI/GameEvents.cpp
    src/GameAPI/GameFaction.cpp
    src/GameAPI/GameObject.cpp
    src/GameAPI/GamePosition.cpp
    src/GameAPI/GameRecordIdentifier.cpp
    src/GameAPI/GameSex.cpp
    src/GameAPI/GameSlotMask.cpp
    src/GameAPI/GameSound.cpp
    src/GameAPI/GameUtil.cpp
    src/GameLogic/GameHooks.cpp
    src/GameLogic/GameTable.cpp
    src/Graph/Action/Peak/Distance/BoneDistance/BoneDistancePeakType.cpp
    src/Graph/Action/Peak/Loop/LoopPeakType.cpp
    src/Graph/Action/Peak/PeakType.cpp
    src/Graph/Action/Action.cpp
    src/Graph/Action/ActionAttributes.cpp
    src/Graph/Action/ActionTag.cpp
    src/Graph/GraphTable/GraphTableActions.cpp
    src/Graph/GraphTable/GraphTableEvents.cpp
    src/Graph/GraphTable/GraphTableNodes.cpp
    src/Graph/GraphTable/GraphTableSequences.cpp
    src/Graph/GraphTable/GraphTableSetupNodes.cpp
    src/Graph/GraphTable/GraphTableSetupOptions.cpp
    src/Graph/Node/NodeNavigation.cpp
    src/Graph/Event.cpp
    src/Graph/GraphActor.cpp
    src/Graph/GraphActorTag.cpp
    src/Graph/Node.cpp
    src/Graph/NodeTag.cpp
    src/Graph/Sequence.cpp
    src/InterfaceSpec/PluginInterface.cpp
    src/MCM/MCMSetting.cpp
    src/MCM/MCMTable.cpp
    src/Messaging/MessagingRegistry.cpp
	src/PCH.h
	src/Papyrus/Papyrus.cpp
	src/Papyrus/Script.h
    src/PluginInterfaceImplementation/Settings/SettingInterfaceImpl.cpp
    src/PluginInterfaceImplementation/SexToys/SexToyInterfaceImpl.cpp
    src/PluginInterfaceImplementation/Threading/ThreadInterfaceImpl.cpp
    src/PluginInterfaceImplementation/InterfaceMapImpl.cpp
	src/ScriptAPI/ActionDataScript.cpp
	src/ScriptAPI/ActorScript.cpp
	src/ScriptAPI/JsonScript.cpp
	src/ScriptAPI/LibraryScript.cpp
	src/ScriptAPI/MetadataScript.cpp
	src/ScriptAPI/PlayerThreadScript.cpp
	src/ScriptAPI/SettingsScript.cpp
	src/ScriptAPI/ThreadScript.cpp
	src/Serial/Manager.cpp
    src/Settings/ExportImport/ExportInstance.cpp
    src/Settings/ExportImport/ImportInstance.cpp
    src/Settings/Implementation/BaseTypes/BaseSetting.cpp
    src/Settings/Implementation/BaseTypes/DropDownSetting.cpp
    src/Settings/Implementation/BaseTypes/KeyMapSetting.cpp
    src/Settings/Implementation/BaseTypes/MinMaxSliderSetting.cpp
    src/Settings/Implementation/BaseTypes/SliderSetting.cpp
    src/Settings/Implementation/BaseTypes/ToggleSetting.cpp
    src/Settings/Implementation/GameVariable/GameVariableDropDownSetting.cpp
    src/Settings/Implementation/GameVariable/GameVariableKeyMapSetting.cpp
    src/Settings/Implementation/GameVariable/GameVariableSliderSetting.cpp
    src/Settings/Implementation/GameVariable/GameVariableToggleSetting.cpp
    src/Settings/Implementation/Lambda/AdvancedLambdaDropDownSetting.cpp
    src/Settings/Implementation/Lambda/SimpleLambdaDropDownSetting.cpp
    src/Settings/Implementation/Plugin/PluginSetting.cpp
    src/Settings/Implementation/Plugin/PluginSettingGroup.cpp
    src/Settings/Implementation/Plugin/PluginSettingPage.cpp
    src/Settings/Implementation/Pointer/PointerMinMaxSliderSetting.cpp
    src/Settings/Implementation/Pointer/PointerProviderMinMaxSliderSetting.cpp
    src/Settings/Implementation/Pointer/PointerProviderSliderSetting.cpp
    src/Settings/Implementation/Pointer/PointerProviderToggleSetting.cpp
    src/Settings/Implementation/Pointer/PointerSliderSetting.cpp
    src/Settings/Implementation/Pointer/PointerToggleSetting.cpp
    src/Settings/Implementation/SimpleSettingGroup.cpp
    src/Settings/Implementation/SimpleSettingPage.cpp
    src/Settings/AddonPage.cpp
    src/Settings/SettingTable.cpp
    src/SexToys/Menu/ToySettingMenu.cpp
    src/SexToys/Settings/ClimaxSettings.cpp
    src/SexToys/Settings/ScalingSettings.cpp
    src/SexToys/Settings/ScalingType.cpp
    src/SexToys/Settings/Settings.cpp
    src/SexToys/Settings/SlotSettings.cpp
    src/SexToys/Settings/SynchronizationSettings.cpp
    src/SexToys/Settings/SynchronizationType.cpp
    src/SexToys/Settings/ToySettings.cpp
    src/SexToys/ToyGroup.cpp
    src/SexToys/ToyHandler.cpp
    src/SexToys/ToyTable.cpp
    src/SexToys/ToyThread.cpp
    src/SexToys/ToyWrapper.cpp
	src/Sound/ActionSound/BoneDistanceSoundPlayer.cpp
	src/Sound/ActionSound/BoneDistanceSoundType.cpp
	src/Sound/ActionSound/LoopSoundPlayer.cpp
	src/Sound/ActionSound/LoopSoundType.cpp
	src/Sound/ActionSound/MultiBoneDistanceSoundPlayer.cpp
	src/Sound/ActionSound/PeakSoundPlayer.cpp
	src/Sound/ActionSound/PeakSoundType.cpp
	src/Sound/ActionSound/SingleBoneDistanceSoundPlayer.cpp
	src/Sound/ActionSound/SoundPlayer.cpp
	src/Sound/ActionSound/SoundType.cpp
	src/Sound/SoundTable.cpp
    src/Sound/SoundUtil.cpp
    src/Threading/Thread/Peak/Distance/BoneDistance/MultiBoneDistancePeakHandler.cpp
    src/Threading/Thread/Peak/Distance/BoneDistance/SingleBoneDistancePeakHandler.cpp
    src/Threading/Thread/Peak/Distance/DistancePeakHandler.cpp
    src/Threading/Thread/Peak/Loop/LoopPeakHandler.cpp
    src/Threading/Thread/Peak/PeakHandler.cpp
    src/Threading/Thread/NodeHandler.cpp
    src/Trait/Condition.cpp
    src/Trait/FacialExpression.cpp
    src/Trait/TraitTable.cpp
    src/UI/Align/AlignMenu.cpp
    src/UI/Align/IncrementValue.cpp
    src/UI/Scene/SceneMenu.cpp
    src/UI/Scene/SceneOptions.cpp
    src/UI/Search/SearchMenu.cpp
    src/UI/OStimMenu.cpp
    src/UI/Settings.cpp
    src/UI/UIState.cpp
    src/Util/ActorUtil.cpp
    src/Util/APITable.cpp
    src/Util/CameraUtil.cpp
    src/Util/CheckSum.cpp
    src/Util/CompatibilityTable.cpp
    src/Util/ControlUtil.cpp
    src/Util/FormUtil.cpp
    src/Util/Globals.cpp
    src/Util/IDGenerator.cpp
    src/Util/Integrity.cpp
    src/Util/JsonUtil.cpp
    src/Util/LegacyUtil.cpp
    src/Util/LookupTable.cpp
    src/Util/MathUtil.cpp
    src/Util/ObjectRefUtil.cpp
    src/Util/SerializationUtil.cpp
    src/Util/StringUtil.cpp
    src/Util/VectorUtil.cpp
	src/Core.cpp
	src/Util.cpp
	src/main.cpp
        src/ModAPI/OstimNG-API-Main.cpp 
        src/ModAPI/OstimNG-API-Main.h
        src/ModAPI/OstimNG-API-Scene.h 
        src/ModAPI/OstimNG-API-Scene.cpp

        ${CMAKE_CURRENT_BINARY_DIR}/version.rc)

source_group(
        TREE ${CMAKE_CURRENT_SOURCE_DIR}
        FILES
        ${headers}
        ${sources})

########################################################################################################################
## Configure target DLL
########################################################################################################################
find_package(pugixml REQUIRED)
find_package(nlohmann_json REQUIRED)
find_package(CommonLibSSE CONFIG REQUIRED)
find_package(ryml CONFIG REQUIRED)
find_package(OpenSSL REQUIRED)
find_path(ARTICUNO_INCLUDE_DIRS "articuno/articuno.h")

add_commonlibsse_plugin(${PROJECT_NAME} SOURCES ${headers} ${sources})
add_library("${PROJECT_NAME}::${PROJECT_NAME}" ALIAS "${PROJECT_NAME}")

target_include_directories(${PROJECT_NAME}
        PRIVATE
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/src>
        $<BUILD_INTERFACE:${CMAKE_CURRENT_BINARY_DIR}/src>
        $<INSTALL_INTERFACE:src>
        ${ARTICUNO_INCLUDE_DIRS})

target_include_directories(${PROJECT_NAME}
        PUBLIC
        $<BUILD_INTERFACE:${CMAKE_CURRENT_SOURCE_DIR}/include>)

target_link_libraries(${PROJECT_NAME}
        PRIVATE
        ryml::ryml
        pugixml
        nlohmann_json::nlohmann_json
        OpenSSL::SSL)

target_precompile_headers(${PROJECT_NAME}
        PRIVATE
        src/PCH.h)

install(DIRECTORY "${CMAKE_CURRENT_SOURCE_DIR}/include/Sample"
        DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}")

install(TARGETS ${PROJECT_NAME}
        DESTINATION "${CMAKE_INSTALL_LIBDIR}")

set(OUTPUT_FOLDER "../../../data")

if(DEFINED OUTPUT_FOLDER)
    # If you specify an <OUTPUT_FOLDER> (including via environment variables)
    # then we'll copy your mod files into Skyrim or a mod manager for you!

    # Copy the SKSE plugin .dll files into the SKSE/Plugins/ folder
    set(DLL_FOLDER "${OUTPUT_FOLDER}/SKSE/Plugins")

    message(STATUS "SKSE plugin output folder: ${DLL_FOLDER}")

    add_custom_command(
        TARGET "${PROJECT_NAME}"
        POST_BUILD
        COMMAND "${CMAKE_COMMAND}" -E make_directory "${DLL_FOLDER}"
        COMMAND "${CMAKE_COMMAND}" -E copy_if_different "$<TARGET_FILE:${PROJECT_NAME}>" "${DLL_FOLDER}/$<TARGET_FILE_NAME:${PROJECT_NAME}>"
        VERBATIM
    )
    
    # Copy the SKSE plugin .pdb files into the SKSE/Plugins/ folder
    add_custom_command(
        TARGET "${PROJECT_NAME}"
        POST_BUILD
        COMMAND "${CMAKE_COMMAND}" -E copy_if_different "$<TARGET_PDB_FILE:${PROJECT_NAME}>" "${DLL_FOLDER}/$<TARGET_PDB_FILE_NAME:${PROJECT_NAME}>"
        VERBATIM
    )
endif()