cmake_minimum_required(VERSION 3.5)
project(sfxr-qt)

find_package(Qt5Core)
find_package(Qt5Qml)
find_package(Qt5Quick)
find_package(Qt5Widgets)

#string(REGEX REPLACE "gcc$" "g++" CMAKE_CXX_COMPILER "${CMAKE_CXX_COMPILER}")

#LIST(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/lib")

# Get Architecture triplet
execute_process(
    COMMAND dpkg-architecture -qDEB_HOST_MULTIARCH
    OUTPUT_VARIABLE ARCH_TRIPLET
    OUTPUT_STRIP_TRAILING_WHITESPACE
)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD 14)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Woverloaded-virtual")
#set(CMAKE_CXX_STANDARD_REQUIRED ON)
#set(CMAKE_CXX_EXTENSIONS OFF)

#find_package(SDL2 REQUIRED)
#find_package(Qt5 REQUIRED Gui Quick Widgets)
#include(qpropgen/cmake/qpropgen.cmake)

#set(QT_IMPORTS_DIR "lib/${ARCH_TRIPLET}")


#set(CMAKE_CXX_EXTENSIONS OFF)

#set(CMAKE_REQUIRED_FLAGS ${CMAKE_CXX11_EXTENSION_COMPILE_OPTION}) #https://cmake.org/Bug/view.php?id=15550
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Woverloaded-virtual -std=c++11")




set(sfxr_qt_lib_SRCS
    core/BaseSoundListModel.cpp
    core/BaseWavSaver.cpp
    core/Synthesizer.cpp
    core/NoiseGenerator.cpp
    core/WavSaver.cpp
    core/BaseSound.cpp
    core/Sound.cpp
    core/SoundUtils.cpp
    core/SoundPlayer.cpp
    core/SoundListModel.cpp
    core/SoundIO.cpp
    core/Result.cpp
    core/WaveForm.cpp
)

add_library(sfxr-qt-lib STATIC ${sfxr_qt_lib_SRCS})


#include SDL2 sources
add_subdirectory(lib)
target_link_libraries(sfxr-qt-lib SDL2 Qt5::Qml Qt5::Core)

target_include_directories(sfxr-qt-lib
    PUBLIC core
    PUBLIC ${CMAKE_CURRENT_BINARY_DIR}/core
    PRIVATE ${CMAKE_CURRENT_LIST_DIR}/lib/SDL2/include
)

# sfxr-qt
set(sfxr_qt_app_SRCS
    ui/main.cpp
    ui/Generator.cpp
)

qt5_add_resources(QRC_SRCS ui/qml.qrc)

add_executable(sfxr-qt ${sfxr_qt_app_SRCS} ${QRC_SRCS})
target_link_libraries(sfxr-qt
    sfxr-qt-lib
    Qt5::Widgets
    Qt5::Quick
)

target_include_directories(sfxr-qt
    PRIVATE ui
)
#execute_process(
#    COMMAND dpkg-architecture -qDEB_HOST_MULTIARCH
#    OUTPUT_VARIABLE ARCH_TRIPLET
#    OUTPUT_STRIP_TRAILING_WHITESPACE
#)
#set(SOMELIBRARY_DIR "${CMAKE_SOURCE_DIR}/build/somelib/${ARCH_TRIPLET}")
#find_package(SOMELIBRARY REQUIRED)
#include_directories(${SOMELIBRARY_INCLUDE_DIRS})
#target_link_libraries(mytarget ${SOMELIBRARY_LIBS})



#option (UBUNTU_TOUCH "Build for Ubuntu Touch." OFF)
if (UBUNTU_TOUCH)
    message("Building for Ubuntu Touch")

    #execute_process(
    #    COMMAND dpkg-architecture -qDEB_HOST_ARCH
    #    OUTPUT_VARIABLE CLICK_ARCH
    #    OUTPUT_STRIP_TRAILING_WHITESPACE
    #)
    if(DEFINED ENV{ARCH})
        set(CLICK_ARCH "$ENV{ARCH}")
    else()
        execute_process(
            COMMAND dpkg-architecture -qDEB_HOST_ARCH
            OUTPUT_VARIABLE CLICK_ARCH
            OUTPUT_STRIP_TRAILING_WHITESPACE
        )
    endif()


    set(UT_PATH ${CMAKE_CURRENT_SOURCE_DIR}/packaging/ubuntu_touch)
    configure_file(${UT_PATH}/manifest.json.in ${CMAKE_CURRENT_BINARY_DIR}/manifest.json)
    install(FILES ${CMAKE_CURRENT_BINARY_DIR}/manifest.json DESTINATION /)
    install(FILES ${UT_PATH}/sfxr.apparmor DESTINATION /)
    install(FILES ${UT_PATH}/sfxr.png DESTINATION /)
    install(FILES ${UT_PATH}/sfxr.desktop DESTINATION /)
    #install(FILES assets/logo.png DESTINATION /assets/)

    install(TARGETS ${PROJECT_NAME} RUNTIME DESTINATION /)
    add_definitions(-DQ_OS_UBUNTU_TOUCH)

else()

    # Installation
    install(TARGETS sfxr-qt RUNTIME DESTINATION bin)

    install(FILES ui/icons/sfxr-qt.desktop
        DESTINATION share/applications
        RENAME com.agateau.sfxr-qt.desktop
    )

    foreach(size 16 32 48)
        install(FILES ui/icons/sfxr-qt-${size}.png
            DESTINATION share/icons/hicolor/${size}x${size}/apps
            RENAME sfxr-qt.png
        )
    endforeach()

endif ()



