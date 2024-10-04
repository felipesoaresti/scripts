#!/bin/bash

# Verifica se o diretório de destino existe, se não, cria
destino="caminho/do/seu/diretorio"
mkdir -p "$destino"

# Loop infinito
while true; do
    # Gera um nome de arquivo único baseado na data e hora atual
    arquivo="$destino/arquivo_$(date +%Y%m%d%H%M%S).txt"

    # Cria o arquivo com 3 linhas
    echo "Linha 1" > "$arquivo"
    echo "Linha 2" >> "$arquivo"
    echo "Linha 3" >> "$arquivo"

    echo "Arquivo criado: $arquivo"

    # Aguarda um curto período antes de criar o próximo arquivo
    sleep 1
done