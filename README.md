# 🛠️ Shell Scripts

Coleção de shell scripts utilitários para administração de sistemas Linux.

---

## Scripts disponíveis

| Script | Descrição |
|--------|-----------|
| [backup-logs.sh](backup-logs.sh) | Backup automático de arquivos de log em `/opt` com mais de 1 ano |
| [restore-logs.sh](restore-logs.sh) | Restauração dos logs a partir do backup gerado |
| [tamanho-logs.sh](tamanho-logs.sh) | Relatório de tamanho dos arquivos de log em `/opt` |
| [date80_renew.sh](date80_renew.sh) | Renovação de certificados com controle de última execução |
| [eterno.sh](eterno.sh) | Loop infinito para geração contínua de arquivos (testes/stress) |
| [proxy.sh](proxy.sh) | Configuração de variáveis de proxy no `/etc/profile.d/` |
| [nfs_df](nfs_df) | Plugin Checkmk: coleta uso de volumes NFS via `df` com timeout |

---

## Uso rápido

```bash
# Backup de logs antigos
chmod +x backup-logs.sh && sudo ./backup-logs.sh

# Ver tamanho dos logs antes de fazer backup
chmod +x tamanho-logs.sh && sudo ./tamanho-logs.sh

# Configurar proxy no sistema
sudo cp proxy.sh /etc/profile.d/proxy.sh
# Editar MY_PROXY_URL dentro do arquivo antes de copiar

# Plugin NFS para Checkmk (copiar para pasta de plugins do agente)
sudo cp nfs_df /usr/lib/check_mk_agent/plugins/
sudo chmod +x /usr/lib/check_mk_agent/plugins/nfs_df
```

---

## Autor

Felipe Soares — [github.com/felipesoaresti](https://github.com/felipesoaresti)
