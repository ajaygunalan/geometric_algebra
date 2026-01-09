cmake_minimum_required(VERSION 3.16)
project(ga_sandbox LANGUAGES C CXX)

set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Find dependencies
find_package(OpenGL REQUIRED)
find_package(GLUT REQUIRED)

# FLTK
find_package(FLTK QUIET)
if(NOT FLTK_FOUND)
    # Try pkg-config as fallback
    find_package(PkgConfig)
    if(PkgConfig_FOUND)
        pkg_check_modules(FLTK REQUIRED fltk)
    endif()
endif()

# Build libraries
add_subdirectory(libgasandbox)
add_subdirectory(qhull-2003.1)

# Build chapters (skip chap8, chap9 - no examples)
add_subdirectory(chap1)
add_subdirectory(chap2)
add_subdirectory(chap3)
add_subdirectory(chap4)
add_subdirectory(chap5)
add_subdirectory(chap6)
add_subdirectory(chap7)
add_subdirectory(chap10)
add_subdirectory(chap11)
add_subdirectory(chap12)
add_subdirectory(chap13)
add_subdirectory(chap14)
add_subdirectory(chap15)
add_subdirectory(chap16)
