add_executable(chap2ex1 ex1/chap2ex1.cpp)
target_link_libraries(chap2ex1 gasandbox)

add_executable(chap2ex2 ex2/chap2ex2.cpp)
target_link_libraries(chap2ex2 gasandbox)

add_executable(chap2ex3
    ex3/main.cpp
    ex3/fields.cpp
    ex3/hpindex.cpp
    ex3/render.cpp
)
target_include_directories(chap2ex3 PRIVATE ex3)
target_link_libraries(chap2ex3 gasandbox)

# Solutions
add_executable(chap2ex2s solutions/ex2/chap2ex2s.cpp)
target_link_libraries(chap2ex2s gasandbox)
