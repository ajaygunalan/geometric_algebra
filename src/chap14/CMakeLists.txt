add_executable(chap14ex1 ex1/chap14ex1.cpp)
target_link_libraries(chap14ex1 gasandbox qhull)

add_executable(chap14ex2 ex2/chap14ex2.cpp)
target_link_libraries(chap14ex2 gasandbox qhull)

add_executable(chap14ex3 ex3/chap14ex3.cpp)
target_link_libraries(chap14ex3 gasandbox qhull)

# chap14ex4 requires OpenCV
find_package(OpenCV QUIET)
if(OpenCV_FOUND)
    add_executable(chap14ex4 ex4/chap14ex4.cpp)
    target_link_libraries(chap14ex4 gasandbox qhull ${OpenCV_LIBS})
endif()

# Solutions
add_executable(chap14ex2s solutions/ex2/chap14ex2s.cpp)
target_link_libraries(chap14ex2s gasandbox qhull)
