add_executable(chap13ex1 ex1/chap13ex1.cpp)
target_link_libraries(chap13ex1 gasandbox)

add_executable(chap13ex2 ex2/chap13ex2.cpp)
target_link_libraries(chap13ex2 gasandbox)

add_executable(chap13ex3 ex3/chap13ex3.cpp)
target_link_libraries(chap13ex3 gasandbox)

add_executable(chap13ex4 ex4/chap13ex4.cpp)
target_link_libraries(chap13ex4 gasandbox)

# Solutions
add_executable(chap13ex2s solutions/ex2/chap13ex2s.cpp)
target_link_libraries(chap13ex2s gasandbox)
