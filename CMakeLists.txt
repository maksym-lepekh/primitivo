cmake_minimum_required(VERSION 3.20)
project(primitivo)


add_library(primitivo INTERFACE)
target_include_directories(primitivo INTERFACE include)
target_compile_features(primitivo INTERFACE cxx_std_20)

add_executable(test tests/main.cpp)
target_link_libraries(test primitivo)
