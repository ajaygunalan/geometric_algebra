add_executable(chap10ex1 ex1/chap10ex1.cpp)
target_link_libraries(chap10ex1 gasandbox)

add_executable(chap10ex2 ex2/chap10ex2.cpp)
target_link_libraries(chap10ex2 gasandbox)

# chap10ex3 requires OpenCV and ANTLR
find_package(OpenCV QUIET)
if(OpenCV_FOUND)
    add_executable(chap10ex3
        ex3/chap10ex3.cpp
        ex3/extcalibrefine.cpp
        ex3/readcalibrationdata.cpp)
    target_link_libraries(chap10ex3 gasandbox ${OpenCV_LIBS})
endif()
