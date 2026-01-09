file(GLOB QHULL_SOURCES "src/*.c")
add_library(qhull STATIC ${QHULL_SOURCES})
target_include_directories(qhull PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/src)
