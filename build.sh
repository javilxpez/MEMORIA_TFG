#!/usr/bin/env bash
# Compila desde la raíz para que los documentos puedan usar /shared.
#   ./build.sh          → build/tfg.pdf
#   ./build.sh watch    → recompila al guardar
set -euo pipefail
cd "$(dirname "$0")"
mkdir -p build
cmd=${1:-compile}
typst "$cmd" --root . --font-path fonts tfg/main.typ build/tfg.pdf
