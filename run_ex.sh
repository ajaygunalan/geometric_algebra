#!/bin/bash

# Check if arguments are provided
if [ $# -lt 2 ]; then
    echo "Usage: ./run_ex.sh <chapter_number> <example_number>"
    echo "Example: ./run_ex.sh 1 1"
    exit 1
fi

CHAP=$1
EX=$2

# Construct the path
# Examples are in build/chap<N>/ex<M>/chap<N>ex<M>
TARGET_DIR="build/chap${CHAP}/ex${EX}"
BINARY="chap${CHAP}ex${EX}"

if [ -f "${TARGET_DIR}/${BINARY}" ]; then
    echo "Running Chapter ${CHAP}, Example ${EX}..."
    cd "${TARGET_DIR}" && "./${BINARY}"
else
    echo "Error: Binary not found at ${TARGET_DIR}/${BINARY}"
    echo "Note: You might need to compile this chapter first."
fi
