#!/bin/bash

# Caminho base
BASE="./"
UTILITIES="$BASE/utilities/polybench.c"
INCLUDE="-I $BASE/utilities"

# Lista de programas
PROGRAMAS=("gemm" "gemver" "jacobi-2d")

# Compila cada programa com versão sem flag, -O0, -O3 e -Ofast
for PROG in "${PROGRAMAS[@]}"; do
    echo "==============================="
    echo "[+] Compilando $PROG"
    echo "==============================="

    SRC="$BASE/$PROG/$PROG.c"

    # Compilar versão sem flag de otimização
    DIR="$BASE/$PROG/default"
    mkdir -p "$DIR"
    echo "   -> Compilando versão padrão (sem otimização)..."
    gcc "$SRC" "$UTILITIES" $INCLUDE -o "$DIR/${PROG}_default.out" || {
        echo "[-] Falha ao compilar $PROG (versão padrão)"
        exit 1
    }

    # Compilar versões otimizadas
    for FLAG in O0 O3 Ofast; do
        DIR="$BASE/$PROG/${FLAG,,}"
        mkdir -p "$DIR"

        echo "   -> Compilando com -$FLAG..."
        gcc -$FLAG "$SRC" "$UTILITIES" $INCLUDE -o "$DIR/${PROG}_${FLAG,,}.out" || {
            echo "[-] Falha ao compilar $PROG com -$FLAG"
            exit 1
        }
    done

    echo "[✓] $PROG compilado com sucesso!"
    echo
done

echo "[✓] Todos os programas compilados!"
