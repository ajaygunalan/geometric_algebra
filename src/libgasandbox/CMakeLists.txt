file(GLOB_RECURSE GASANDBOX_SOURCES "*.cpp")
add_library(gasandbox STATIC ${GASANDBOX_SOURCES})

# Include path must be src/ (parent) because source files use:
#   #include <libgasandbox/common.h>
target_include_directories(gasandbox PUBLIC ${CMAKE_SOURCE_DIR})

target_link_libraries(gasandbox
    OpenGL::GL
    OpenGL::GLU
    GLUT::GLUT
)

if(FLTK_FOUND)
    target_include_directories(gasandbox PUBLIC ${FLTK_INCLUDE_DIRS})
    target_link_libraries(gasandbox ${FLTK_LIBRARIES})
endif()
