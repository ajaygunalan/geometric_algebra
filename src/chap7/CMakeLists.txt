add_executable(chap7ex1 ex1/chap7ex1.cpp)
target_link_libraries(chap7ex1 gasandbox)

add_executable(chap7ex2 ex2/chap7ex2.cpp)
target_link_libraries(chap7ex2 gasandbox)

add_executable(chap7ex3 ex3/chap7ex3.cpp)
target_link_libraries(chap7ex3 gasandbox)

add_executable(chap7ex4 ex4/chap7ex4.cpp)
target_link_libraries(chap7ex4 gasandbox)

add_executable(chap7ex5 ex5/chap7ex5.cpp)
target_link_libraries(chap7ex5 gasandbox)

# Solutions
add_executable(chap7ex4s solutions/ex4/chap7ex4s.cpp)
target_link_libraries(chap7ex4s gasandbox)

add_executable(chap7ex5s solutions/ex5/chap7ex5s.cpp)
target_link_libraries(chap7ex5s gasandbox)
