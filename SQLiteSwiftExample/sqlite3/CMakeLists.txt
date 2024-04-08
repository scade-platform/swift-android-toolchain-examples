cmake_minimum_required(VERSION 3.0)
project(sqlite3)

add_library(sqlite3 SHARED build/src/sqlite3.c)

