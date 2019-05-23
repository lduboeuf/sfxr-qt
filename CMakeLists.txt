project(sfxr-qt C CXX)
cmake_minimum_required(VERSION 3.1)

# Get Architecture triplet
execute_process(
    COMMAND dpkg-architecture -qDEB_HOST_MULTIARCH
    OUTPUT_VARIABLE ARCH_TRIPLET
    OUTPUT_STRIP_TRAILING_WHITESPACE
)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)

find_package(SDL REQUIRED)
#find_package(Qt5 REQUIRED Gui Quick Widgets)
find_package(Qt5Core)
find_package(Qt5Qml)
find_package(Qt5Quick)
find_package(Qt5Widgets)
#include(qpropgen/cmake/qpropgen.cmake)

set(QT_IMPORTS_DIR "lib/${ARCH_TRIPLET}")


#set(CMAKE_CXX_EXTENSIONS OFF)

#set(CMAKE_REQUIRED_FLAGS ${CMAKE_CXX11_EXTENSION_COMPILE_OPTION}) #https://cmake.org/Bug/view.php?id=15550
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Wall -Woverloaded-virtual -std=c++11")


include_directories(
    ${SDL_INCLUDE_DIR}
    core
    ${CMAKE_CURRENT_BINARY_DIR}/core
)

set(SRCS
    ui/main.cpp
    core/synthesizer.cpp
    core/generator.cpp
    core/noisegenerator.cpp
    core/wavsaver.cpp
    core/sound.cpp
    core/soundplayer.cpp
    core/soundlistmodel.cpp
    core/basesound.cpp
    core/basesoundlistmodel.cpp
    core/basewavsaver.cpp
)

#qpropgen(QPROPGEN_SRCS
#    core/basesound.yaml
#    core/basesoundlistmodel.yaml
#    core/basewavsaver.yaml
#)

qt5_add_resources(QRC_SRCS ui/qml.qrc)

#set_property(SOURCE ${CMAKE_CURRENT_BINARY_DIR}/core/basewavsaver.cpp PROPERTY SKIP_AUTOMOC ON)


add_executable(sfxr-qt ${SRCS} ${QRC_SRCS})
target_link_libraries(sfxr-qt SDL Qt5::Widgets Qt5::Quick)

#execute_process(
#    COMMAND dpkg-architecture -qDEB_HOST_MULTIARCH
#    OUTPUT_VARIABLE ARCH_TRIPLET
#    OUTPUT_STRIP_TRAILING_WHITESPACE
#)
#set(SOMELIBRARY_DIR "${CMAKE_SOURCE_DIR}/build/somelib/${ARCH_TRIPLET}")
#find_package(SOMELIBRARY REQUIRED)
#include_directories(${SOMELIBRARY_INCLUDE_DIRS})
#target_link_libraries(mytarget ${SOMELIBRARY_LIBS})

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

#option (UBUNTU_TOUCH "Build for Ubuntu Touch." OFF)
if (UBUNTU_TOUCH)
    message("Building for Ubuntu Touch")

    set(UT_PATH ${CMAKE_CURRENT_SOURCE_DIR}/packaging/ubuntu_touch)
    install(FILES ${UT_PATH}/manifest.json DESTINATION /)
    install(FILES ${UT_PATH}/sfxr-qt.apparmor DESTINATION /)
    install(FILES ${UT_PATH}/sfxr-qt.desktop DESTINATION /)
    #install(FILES assets/logo.png DESTINATION /assets/)

    install(TARGETS ${PROJECT_NAME} RUNTIME DESTINATION /)


endif ()
