#!/bin/bash

# Caminho base
BASE="./"
PROGRAMAS=("gemm" "atax" "fdtd-2d")
X86_VERSIONS=("default_x86" "o2_x86" "o3_x86")
RISCV_VERSIONS=("riscv_base" "riscv_o2" "riscv_o3" "riscv_unroll" "riscv_fma" "riscv_interchange")
RUNS=3

# QEMU
QEMU_RISCV="qemu-riscv64"
QEMU_X86="qemu-x86_64"

echo "[*] Iniciando execuções com perf para x86 e RISC-V via QEMU..."

# -----------------------------
# 1. Executar binários x86 via QEMU
# -----------------------------
for PROG in "${PROGRAMAS[@]}"; do
    for VER in "${X86_VERSIONS[@]}"; do
        DIR="$BASE/$PROG/$VER"

        BIN="${PROG}_${VER%%_*}.out"
        BIN_PATH="$DIR/$BIN"

        if [ ! -f "$BIN_PATH" ]; then
            echo "[!] Binário x86 não encontrado: $BIN_PATH"
            continue
        fi

        echo
        echo "--------------------------------------"
        echo "[+] Rodando perf x86 via QEMU em $PROG ($VER)"
        echo "--------------------------------------"

        for i in $(seq 1 $RUNS); do
            OUTFILE="$DIR/run${i}.txt"
            echo "   -> Execução $i..."
            sudo perf stat -o "$OUTFILE" -- $QEMU_X86 "$BIN_PATH"
        done
    done
done

# -----------------------------
# 2. Executar binários RISC-V via QEMU
# -----------------------------
for PROG in "${PROGRAMAS[@]}"; do
    for VER in "${RISCV_VERSIONS[@]}"; do
        # Executar apenas versões especiais quando aplicável
        if [[ "$VER" == "riscv_unroll" && "$PROG" != "gemm" ]]; then
            continue
        fi
        if [[ "$VER" == "riscv_fma" && "$PROG" != "atax" ]]; then
            continue
        fi
        if [[ "$VER" == "riscv_interchange" && "$PROG" != "fdtd-2d" ]]; then
            continue
        fi

        DIR="$BASE/$PROG/$VER"

        # Define nome do binário RISC-V
        case "$VER" in
            riscv_base) BIN="${PROG}_riscv_base.out" ;;
            riscv_o2) BIN="${PROG}_riscv_o2.out" ;;
            riscv_o3) BIN="${PROG}_riscv_o3.out" ;;
            riscv_unroll) BIN="${PROG}_riscv_unroll.out" ;;
            riscv_fma) BIN="${PROG}_riscv_fma.out" ;;
            riscv_interchange) BIN="${PROG}_riscv_interchange.out" ;;
            *) continue ;;
        esac

        BIN_PATH="$DIR/$BIN"

        if [ ! -f "$BIN_PATH" ]; then
            echo "[!] Binário RISC-V não encontrado: $BIN_PATH"
            continue
        fi

        echo
        echo "--------------------------------------"
        echo "[+] Rodando perf RISC-V (QEMU) em $PROG ($VER)"
        echo "--------------------------------------"

        for i in $(seq 1 $RUNS); do
            OUTFILE="$DIR/run${i}.txt"
            echo "   -> Execução $i..."
            sudo perf stat -o "$OUTFILE" -- $QEMU_RISCV "$BIN_PATH"
        done
    done
done

echo
echo "[✓] Todas as execuções finalizadas!"
echo "[✓] Resultados salvos como run1.txt, run2.txt, run3.txt em cada pasta."
