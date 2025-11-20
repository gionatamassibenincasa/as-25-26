cmake_minimum_required(VERSION 3.5)

project(somma_due_interi LANGUAGES CXX)

# Require a reasonable C++ standard
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Build the executable from somma.cpp
add_executable(somma somma.cpp)

