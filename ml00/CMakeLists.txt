cmake_minimum_required(VERSION 3.16...3.30 FATAL_ERROR)

project(
  ocaml-modules-ml00
  VERSION 1.0
  DESCRIPTION "Piscine ocaml from 42")

find_program(OCAMLOPT ocamlopt REQUIRED)

set(SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/ex00/ft_test_sign.ml
)

set(EXECUTABLE ${CMAKE_CURRENT_BINARY_DIR}/app)

add_custom_command(
    OUTPUT ${EXECUTABLE}
    COMMAND ${OCAMLOPT} -o ${EXECUTABLE} ${SOURCES}
    DEPENDS ${OCAML_SOURCES}
    COMMENT "Building OCaml executable"
    VERBATIM
)

add_custom_target(run_ocaml ALL
    DEPENDS ${EXECUTABLE}
)
