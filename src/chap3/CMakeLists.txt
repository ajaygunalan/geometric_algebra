add_executable(chap3ex1 ex1/chap3ex1.cpp)
target_link_libraries(chap3ex1 gasandbox)

add_executable(chap3ex2 ex2/chap3ex2.cpp)
target_link_libraries(chap3ex2 gasandbox)

add_executable(chap3ex3 ex3/chap3ex3.cpp)
target_link_libraries(chap3ex3 gasandbox)

add_executable(chap3ex4 ex4/chap3ex4.cpp)
target_link_libraries(chap3ex4 gasandbox)

# Solutions
add_executable(chap3ex2s solutions/ex2/chap3ex2s.cpp)
target_link_libraries(chap3ex2s gasandbox)
