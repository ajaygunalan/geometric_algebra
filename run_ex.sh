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

# Get description for an example (from book website)
get_example_desc() {
    local chap=$1
    local exnum=$2

    case "${chap}-${exnum}" in
        # Chapter 1
        1-1) echo "An Example in Geometric Algebra" ;;
        # Chapter 2
        2-1) echo "Drawing Bivectors" ;;
        2-2) echo "Hidden Surface Removal" ;;
        2-2s) echo "Hidden Surface Removal [SOLUTION]" ;;
        2-3) echo "Singularities in Vector Fields" ;;
        # Chapter 3
        3-1) echo "Orthonormalization" ;;
        3-2) echo "Implementing the Cross Product" ;;
        3-2s) echo "Implementing the Cross Product [SOLUTION]" ;;
        3-3) echo "Reciprocal Frames" ;;
        3-4) echo "Color Space Conversion" ;;
        # Chapter 4
        4-1) echo "Orthogonal Projection" ;;
        4-2) echo "Projection Matrix Representation" ;;
        4-3) echo "Transforming Normal Vectors" ;;
        # Chapter 5
        5-1) echo "The Meet and Join" ;;
        5-2) echo "Efficiency" ;;
        5-3) echo "Floating Point Issues" ;;
        # Chapter 6
        6-1) echo "Subspace Products Retrieved" ;;
        6-1s) echo "Subspace Products Retrieved [SOLUTION]" ;;
        6-2) echo "Gram-Schmidt Orthogonalization" ;;
        # Chapter 7
        7-1) echo "Reflecting in Vectors" ;;
        7-2) echo "Two Reflections = One Rotation" ;;
        7-3) echo "Matrix-Rotor Conversion 1" ;;
        7-4) echo "Matrix-Rotor Conversion 2" ;;
        7-4s) echo "Matrix-Rotor Conversion 2 [SOLUTION]" ;;
        7-5) echo "Julia Fractals" ;;
        7-5s) echo "Julia Fractals [SOLUTION]" ;;
        # Chapter 10
        10-1) echo "Interpolating Rotations" ;;
        10-2) echo "Crystallography" ;;
        10-3) echo "External Camera Calibration" ;;
        # Chapter 11
        11-1) echo "Working with Points" ;;
        11-2) echo "Intersecting Primitives" ;;
        11-3) echo "Don't Add Lines" ;;
        11-4) echo "Perspective Projection" ;;
        11-4s) echo "Perspective Projection [SOLUTION]" ;;
        # Chapter 12
        12-1) echo "Loading Transforms into OpenGL" ;;
        12-2) echo "Transforming with OpenGL Matrices" ;;
        12-3) echo "Marker Reconstruction (Motion Capture)" ;;
        # Chapter 13
        13-1) echo "Metric Matters" ;;
        13-2) echo "Distance Between Points" ;;
        13-2s) echo "Distance Between Points [SOLUTION]" ;;
        13-3) echo "Loading Transforms into OpenGL" ;;
        13-4) echo "Interpolation of Rigid Body Motions" ;;
        # Chapter 14
        14-1) echo "Voronoi Diagrams / Delaunay" ;;
        14-2) echo "Drawing Euclid's Elements" ;;
        14-2s) echo "Drawing Euclid's Elements [SOLUTION]" ;;
        14-3) echo "Conformal Primitives & Intersections" ;;
        14-4) echo "Fitting a Sphere to Points" ;;
        # Chapter 15
        15-1) echo "The Plunge" ;;
        15-2) echo "Affine Combinations of Points" ;;
        15-3) echo "Euclidean Projections" ;;
        # Chapter 16
        16-1) echo "Homogeneous to Conformal Versors" ;;
        16-2) echo "Log of Scaled Rigid Body Motion" ;;
        16-3) echo "Interpolation of Scaled Motions" ;;
        16-4) echo "The Sea Shell" ;;
        # Fallbacks
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
