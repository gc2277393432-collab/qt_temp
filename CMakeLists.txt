cmake_minimum_required(VERSION 3.16)
project(untitled1 VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 REQUIRED COMPONENTS
        Core
        Gui
        Qml
        Quick
        QuickControls2
)

qt_add_executable(untitled1
        main.cpp
)

qt_add_qml_module(untitled1
        URI untitled1
        VERSION 1.0
        QML_FILES
        Main.qml
)

target_link_libraries(untitled1
        PRIVATE
        Qt6::Core
        Qt6::Gui
        Qt6::Qml
        Qt6::Quick
        Qt6::QuickControls2
)

qt_finalize_executable(untitled1)
