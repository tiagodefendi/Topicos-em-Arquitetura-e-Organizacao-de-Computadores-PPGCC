#!/bin/bash

# Caminho base
BASE="./"
PROGRAMAS=("gemm" "gemver" "jacobi-2d")
VERSIONS=("default" "o0" "o3" "ofast")
RUNS=3

echo "[*] Iniciando execuções com perf..."

for PROG in "${PROGRAMAS[@]}"; do
    for VER in "${VERSIONS[@]}"; do
        DIR="$BASE/$PROG/$VER"

        # Define o nome do binário
        if [ "$VER" = "default" ]; then
        BIN="${PROG}_default.out"
        else
        BIN="${PROG}_${VER}.out"
        fi

        BIN_PATH="$DIR/$BIN"

        # Verifica se o binário existe
        if [ ! -f "$BIN_PATH" ]; then
        echo "[!] Binário não encontrado: $BIN_PATH"
        continue
        fi

        echo
        echo "--------------------------------------"
        echo "[+] Rodando perf em $PROG ($VER)"
        echo "--------------------------------------"

        # Executa perf 3 vezes e salva o output
        for i in $(seq 1 $RUNS); do
        OUTFILE="$DIR/run${i}.txt"
        echo "   -> Execução $i..."
        sudo perf stat -o "$OUTFILE" -- "$BIN_PATH"
        done
    done
done

echo
echo "[✓] Todas as execuções finalizadas!"
echo "[✓] Resultados salvos como run1.txt, run2.txt, run3.txt em cada pasta."
