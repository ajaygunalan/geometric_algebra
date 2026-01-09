add_executable(chap11ex1 ex1/chap11ex1.cpp)
target_link_libraries(chap11ex1 gasandbox)

# chap11ex2 requires OpenCV
find_package(OpenCV QUIET)
if(OpenCV_FOUND)
    add_executable(chap11ex2 ex2/chap11ex2.cpp)
    target_link_libraries(chap11ex2 gasandbox ${OpenCV_LIBS})
endif()

add_executable(chap11ex3 ex3/chap11ex3.cpp)
target_link_libraries(chap11ex3 gasandbox)

add_executable(chap11ex4 ex4/chap11ex4.cpp)
target_link_libraries(chap11ex4 gasandbox)

# Solutions
add_executable(chap11ex4s solutions/ex4/chap11ex4s.cpp)
target_link_libraries(chap11ex4s gasandbox)
