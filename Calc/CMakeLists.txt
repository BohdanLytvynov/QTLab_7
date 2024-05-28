cmake_minimum_required(VERSION 3.16)

project(calc VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Quick REQUIRED)

qt_add_executable(appcalc
    main.cpp
)

qt_add_qml_module(appcalc
    URI calc
    VERSION 1.0
    QML_FILES main.qml
    SOURCES calc_back.h calc_back.cpp
    QML_FILES Calc_Button.qml
    QML_FILES SmartTextField.qml
    QML_FILES UI_functions.js
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appcalc PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appcalc
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appcalc
    PRIVATE Qt6::Quick)

include(GNUInstallDirs)
install(TARGETS appcalc
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
