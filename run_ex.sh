#!/bin/bash

# GA Sandbox Example Runner
# Usage:
#   ./run_ex.sh              - List all chapters with examples
#   ./run_ex.sh <chap>       - List examples for a chapter
#   ./run_ex.sh <chap> <ex>  - Run specific example (e.g., 2 1, 2 2s)

BUILD_DIR="build"

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# List all chapters with available examples
list_all_chapters() {
    echo -e "${BLUE}=== GA Sandbox Examples ===${NC}"
    echo ""
    for chapdir in src/chap*/; do
        chap=$(basename "$chapdir" | sed 's/chap//')
        binaries=$(ls ${BUILD_DIR}/chap${chap}/chap${chap}ex* 2>/dev/null | xargs -I{} basename {} 2>/dev/null)
        if [ -n "$binaries" ]; then
            echo -e "${GREEN}Chapter ${chap}:${NC}"
            for bin in $binaries; do
                # Extract example number (e.g., chap2ex1 -> 1, chap2ex2s -> 2s)
                exnum=$(echo "$bin" | sed "s/chap${chap}ex//")
                desc=$(get_example_desc "$chap" "$exnum")
                echo "  ./run_ex.sh ${chap} ${exnum}  - ${desc}"
            done
            echo ""
        fi
    done
    echo -e "${YELLOW}Tip: Run ./run_ex.sh <chapter> to see details for that chapter${NC}"
}

# List examples for a specific chapter
list_chapter_examples() {
    local chap=$1
    local readme="src/chap${chap}/README.md"

    echo -e "${BLUE}=== Chapter ${chap} Examples ===${NC}"
    echo ""

    # Show README if it exists
    if [ -f "$readme" ]; then
        cat "$readme"
        echo ""
    fi

    # List available binaries
    echo -e "${GREEN}Available binaries:${NC}"
    for bin in ${BUILD_DIR}/chap${chap}/chap${chap}ex*; do
        if [ -f "$bin" ]; then
            exnum=$(basename "$bin" | sed "s/chap${chap}ex//")
            desc=$(get_example_desc "$chap" "$exnum")
            echo -e "  ${YELLOW}./run_ex.sh ${chap} ${exnum}${NC} - ${desc}"
        fi
    done

    # Check for unbuild sources
    echo ""
    echo -e "${GREEN}Source directories:${NC}"
    for exdir in src/chap${chap}/ex*/; do
        if [ -d "$exdir" ]; then
            exnum=$(basename "$exdir" | sed 's/ex//')
            binpath="${BUILD_DIR}/chap${chap}/chap${chap}ex${exnum}"
            if [ -f "$binpath" ]; then
                echo -e "  ex${exnum}/ ${GREEN}[built]${NC}"
            else
                echo -e "  ex${exnum}/ ${RED}[not built]${NC}"
            fi
        fi
    done

    # Check for solutions
    if [ -d "src/chap${chap}/solutions" ]; then
        echo ""
        echo -e "${GREEN}Solutions:${NC}"
        for soldir in src/chap${chap}/solutions/ex*/; do
            if [ -d "$soldir" ]; then
                exnum=$(basename "$soldir" | sed 's/ex//')
                binpath="${BUILD_DIR}/chap${chap}/chap${chap}ex${exnum}s"
                if [ -f "$binpath" ]; then
                    echo -e "  ex${exnum}s ${GREEN}[built]${NC} - Solution for ex${exnum}"
                else
                    echo -e "  ex${exnum}s ${RED}[not built]${NC}"
                fi
            fi
        done
    fi
}

# Get description for an example (from README or default)
get_example_desc() {
    local chap=$1
    local exnum=$2

    # Default descriptions for known examples
    case "${chap}-${exnum}" in
        2-1) echo "Drawing Bivectors" ;;
        2-2) echo "Hidden Surface Removal [EXERCISE]" ;;
        2-2s) echo "Hidden Surface Removal [SOLUTION]" ;;
        2-3) echo "Vector Field Singularities" ;;
        3-1) echo "Orthogonal Decomposition" ;;
        3-2) echo "Reciprocal Frame" ;;
        3-2s) echo "Reciprocal Frame [SOLUTION]" ;;
        3-3) echo "Closest Point on Line" ;;
        *s) echo "Solution" ;;
        *) echo "Example ${exnum}" ;;
    esac
}

# Run a specific example
run_example() {
    local chap=$1
    local exnum=$2

    # Binary path
    local binary="${BUILD_DIR}/chap${chap}/chap${chap}ex${exnum}"

    if [ -f "${binary}" ]; then
        echo -e "${GREEN}Running Chapter ${chap}, Example ${exnum}...${NC}"
        "./${binary}"
    else
        echo -e "${RED}Error: Binary not found at ${binary}${NC}"
        echo ""
        echo "Available for chapter ${chap}:"
        ls ${BUILD_DIR}/chap${chap}/chap${chap}ex* 2>/dev/null | xargs -I{} basename {}
        echo ""
        echo -e "${YELLOW}Build with: cd build && cmake ../src && make${NC}"
        exit 1
    fi
}

# Main logic
case $# in
    0)
        list_all_chapters
        ;;
    1)
        list_chapter_examples "$1"
        ;;
    2)
        run_example "$1" "$2"
        ;;
    *)
        echo "Usage:"
        echo "  ./run_ex.sh              - List all chapters"
        echo "  ./run_ex.sh <chap>       - List examples for chapter"
        echo "  ./run_ex.sh <chap> <ex>  - Run example (e.g., 2 1, 2 2s)"
        exit 1
        ;;
esac
