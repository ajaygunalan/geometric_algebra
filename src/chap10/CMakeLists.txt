add_executable(chap10ex1 ex1/chap10ex1.cpp)
target_link_libraries(chap10ex1 gasandbox)

add_executable(chap10ex2 ex2/chap10ex2.cpp)
target_link_libraries(chap10ex2 gasandbox)

# chap10ex3 requires OpenCV and ANTLR - skip (ANTLR 2.x not available on modern systems)
