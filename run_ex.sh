#!/bin/bash

# Check if arguments are provided
if [ $# -lt 2 ]; then
    echo "Usage: ./run_ex.sh <chapter_number> <example_number>"
    echo "Example: ./run_ex.sh 1 1"
    exit 1
fi

CHAP=$1
EX=$2

# Binary path (CMake build structure)
BINARY="build/chap${CHAP}/chap${CHAP}ex${EX}"

if [ -f "${BINARY}" ]; then
    echo "Running Chapter ${CHAP}, Example ${EX}..."
    "./${BINARY}"
else
    echo "Error: Binary not found at ${BINARY}"
    echo "Build with: cd build && cmake ../src && make"
fi
