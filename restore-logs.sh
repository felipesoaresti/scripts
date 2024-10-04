#!/bin/bash

# TESTE ------ Felipe Soares


# Diretório de origem e destino
source_dir="/opt"
backup_dir="/var/backup"

# Verificar se há arquivos de backup disponíveis
backup_files=("$backup_dir"/*.tar.gz)

if [ ${#backup_files[@]} -eq 0 ]; then
    echo "Nenhum arquivo de backup encontrado em $backup_dir."
    exit 1
fi

# Listar os arquivos de backup disponíveis
echo "Arquivos de backup disponíveis:"
for file in "${backup_files[@]}"; do
    echo "$file"
done

# Perguntar qual backup deve ser restaurado
read -p "Digite o nome do arquivo de backup que deseja restaurar: " selected_backup

# Verificar se o arquivo de backup selecionado existe
if [ ! -f "$backup_dir/$selected_backup" ]; then
    echo "Arquivo de backup não encontrado."
    exit 1
fi

# Descompactar o arquivo de backup
echo "Restaurando arquivos do backup..."
tar -xzf "$backup_dir/$selected_backup" -C "$source_dir"

echo "Restauração concluída com sucesso."

exit 0
