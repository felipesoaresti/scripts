#!/bin/bash
#
#Script adaptado
#Autor: Felipe Soares
#V1.2
#04/10

#Arquivo ultima execução

timestamp_file="/root/ultima_execucao.txt"

#Checar se o arquivo existe 

if [ -f "$timestamp_file" ]; then
        last_run=$(cat "$timestamp_file")
        current_time=$(date +%s)
        days_since_last_run=$(( (current_time - last_run) / 86400 ))  # Calcular a ultima execução
                if [ "$days_since_last_run" -lt 80 ]; then
                        echo "Ainda não tem 80 dias a Ultima execução"
                        exit 0

        fi

fi
/usr/bin/certbot renew --no-verify-ssl

#Incrementar a da ta da ultima execução 
date +%s > "$timestamp_file"