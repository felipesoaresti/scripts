#!/bin/bash

#TESTE ---------- Felipe Soares



# Diretório de origem
source_dir="/opt"

# Encontrar todos os arquivos nas pastas log e logs em /opt e subdiretórios com mais de um ano
log_files=$(find "$source_dir" -type d \( -name "log" -o -name "logs" \) -exec find {} -type f -mtime +365 \;)

# Verificar se foram encontrados arquivos nas pastas log e logs
if [ -z "$log_files" ]; then
    echo "Nenhum arquivo com mais de um ano encontrado em $source_dir/log ou $source_dir/logs."
    exit 1
fi

# Calcular o tamanho total em megabytes
total_size=0
for file in $log_files; do
    size=$(du -m "$file" | awk '{print $1}')
    total_size=$((total_size + size))
done

# Lista todos os arquivos com mais de um ano
echo "Listando arquivos nas pastas log e logs com mais de um ano:"
echo "$log_files"

# Informar o tamanho total em megabytes
echo "Tamanho total dos arquivos: $total_size megabytes."

exit 0
