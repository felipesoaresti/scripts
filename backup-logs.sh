#!/bin/bash

#TESTE --- FELIPE SOARES


# Diretório de origem e destino
source_dir="/opt"
backup_dir="/var/backup"

# Encontrar todos os arquivos nas pastas log e logs em /opt e subdiretórios com mais de um ano
log_files=$(find "$source_dir" -type d \( -name "log" -o -name "logs" \) -exec find {} -type f -mtime +365 \;)

# Verificar se foram encontrados arquivos nas pastas log e logs
if [ -z "$log_files" ]; then
    echo "Nenhum arquivo com mais de um ano encontrado em $source_dir/log ou $source_dir/logs."
    exit 1
fi

# Lista todos os arquivos com mais de um ano
echo "Listando arquivos nas pastas log e logs com mais de um ano:"
echo "$log_files"

# Pergunta se deseja fazer backup
read -p "Deseja fazer backup dos arquivos listados acima? (s/n): " response

if [ "$response" == "s" ]; then
    # Compactando os arquivos na pasta /var/backup
    backup_filename="backup_$(date '+%Y%m%d%H%M%S').tar.gz"
    tar -czf "$backup_dir/$backup_filename" $log_files

    echo "Backup concluído com sucesso em $backup_dir/$backup_filename."

    # Pergunta se deseja remover os arquivos originais
    read -p "Deseja remover os arquivos originais? (s/n): " remove_response

    if [ "$remove_response" == "s" ]; then
        # Apaga os arquivos originais
        echo "Removendo os arquivos originais..."
        rm -f $log_files
        echo "Arquivos removidos com sucesso."
    else
        echo "Operação cancelada. Os arquivos originais não foram removidos."
    fi
else
    echo "Operação cancelada. Nenhum backup foi criado."
fi

exit 0
