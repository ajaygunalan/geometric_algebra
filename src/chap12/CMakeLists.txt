add_executable(chap12ex1 ex1/chap12ex1.cpp)
target_link_libraries(chap12ex1 gasandbox)

# chap12ex2 requires OpenCV
find_package(OpenCV QUIET)
if(OpenCV_FOUND)
    add_executable(chap12ex2 ex2/chap12ex2.cpp)
    target_link_libraries(chap12ex2 gasandbox ${OpenCV_LIBS})
endif()

# chap12ex3 requires ANTLR - skip (ANTLR 2.x not available on modern systems)
