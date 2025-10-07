#!/bin/bash

# ================================================================
#  SCRIPT DE COMPILACAO AUTOMATICA PARA BENCHMARKS (x86 e RISC-V)
#  usando _minimal.c (sem .h nem utilities)
# ================================================================

set -e

# Caminho base
BASE="./"

# Lista de programas
PROGRAMAS=("gemm" "atax" "fdtd-2d")

# Compiladores
GCC_X86="gcc"
GCC_RISCV="riscv64-linux-gnu-gcc"
RISCV_FLAGS="-march=rv64g -mabi=lp64d"

for PROG in "${PROGRAMAS[@]}"; do
    echo "==============================="
    echo "[+] Compilando $PROG"
    echo "==============================="

    SRC="$BASE/$PROG/${PROG}_minimal.c"

    if [ ! -f "$SRC" ]; then
        echo "[-] ERRO: Arquivo fonte nao encontrado: $SRC"
        exit 1
    fi

    # =======================
    # Compilacao para x86-64
    # =======================
    echo "   -> Compilando para x86-64..."
    for FLAG in default O2 O3; do
        DIR="$BASE/$PROG/${FLAG,,}_x86"
        mkdir -p "$DIR"

        OPTFLAG=""
        [ "$FLAG" != "default" ] && OPTFLAG="-$FLAG"

        echo "      -> x86: $FLAG"
        $GCC_X86 $OPTFLAG "$SRC" -static -o "$DIR/${PROG}_${FLAG,,}.out"
        $GCC_X86 $OPTFLAG "$SRC" -S -o "$DIR/${PROG}_${FLAG,,}.s"
    done

    # =======================
    # Compilacao para RISC-V
    # =======================
    echo "   -> Compilando para RISC-V..."
    for FLAG in base O2 O3; do
        DIR="$BASE/$PROG/riscv_${FLAG,,}"
        mkdir -p "$DIR"

        OPTFLAG=""
        [ "$FLAG" == "O2" ] && OPTFLAG="-O2"
        [ "$FLAG" == "O3" ] && OPTFLAG="-O3"

        echo "      -> RISC-V: $FLAG"
        $GCC_RISCV $RISCV_FLAGS $OPTFLAG "$SRC" -static -o "$DIR/${PROG}_riscv_${FLAG,,}.out"
        $GCC_RISCV $RISCV_FLAGS $OPTFLAG "$SRC" -S -o "$DIR/${PROG}_riscv_${FLAG,,}.s"
    done

    # ================================
    # Compilacao RISC-V com flag extra
    # ================================
    SPECIAL_FLAG=""
    FLAG_NAME=""
    case "$PROG" in
        gemm)
            SPECIAL_FLAG="-funroll-loops"
            FLAG_NAME="unroll"
            ;;
        atax)
            SPECIAL_FLAG="-ffp-contract=fast"
            FLAG_NAME="fma"
            ;;
        fdtd-2d)
            SPECIAL_FLAG="-floop-interchange"
            FLAG_NAME="interchange"
            ;;
    esac

    if [ -n "$SPECIAL_FLAG" ]; then
        DIR="$BASE/$PROG/riscv_${FLAG_NAME}"
        mkdir -p "$DIR"
        echo "   -> Compilando RISC-V (-O3 $SPECIAL_FLAG)..."
        $GCC_RISCV $RISCV_FLAGS -O3 $SPECIAL_FLAG "$SRC" -static -o "$DIR/${PROG}_riscv_${FLAG_NAME}.out"
        $GCC_RISCV $RISCV_FLAGS -O3 $SPECIAL_FLAG "$SRC" -S -o "$DIR/${PROG}_riscv_${FLAG_NAME}.s"
    fi

    echo "[✓] $PROG compilado com sucesso!"
    echo
done

echo "[✓] Todos os programas compilados com sucesso!"
