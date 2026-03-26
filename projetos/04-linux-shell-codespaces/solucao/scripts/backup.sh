#!/bin/bash
# =============================================
# backup.sh — Backup automático de arquivos
# Uso: ./backup.sh /caminho/da/pasta
# =============================================

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m'

log_ok()   { echo -e "${GREEN}[OK]${NC} $1"; }
log_warn() { echo -e "${YELLOW}[AVISO]${NC} $1"; }
log_err()  { echo -e "${RED}[ERRO]${NC} $1"; exit 1; }

# === CONFIGURAÇÃO ===
BACKUP_DIR="$HOME/data/backups"
LOG_FILE="$HOME/logs/backup.log"
RETENCAO_DIAS=7
DATA=$(date +%Y-%m-%d_%H-%M-%S)

echo "=========================================="
echo "  Backup Automático"
echo "  Data: $(date '+%Y-%m-%d %H:%M:%S')"
echo "=========================================="
echo ""

# === VALIDAR ARGUMENTO ===
if [ -z "$1" ]; then
    log_err "Uso: $0 /caminho/da/pasta"
fi

PASTA_ORIGEM="$1"

if [ ! -d "$PASTA_ORIGEM" ]; then
    log_err "Pasta '$PASTA_ORIGEM' não encontrada"
fi

# === CRIAR PASTAS NECESSÁRIAS ===
mkdir -p "$BACKUP_DIR"
mkdir -p "$(dirname "$LOG_FILE")"

# === CONTAR ARQUIVOS ===
TOTAL_ARQUIVOS=$(find "$PASTA_ORIGEM" -type f | wc -l)
TAMANHO=$(du -sh "$PASTA_ORIGEM" | cut -f1)

echo "Origem:   $PASTA_ORIGEM"
echo "Arquivos: $TOTAL_ARQUIVOS"
echo "Tamanho:  $TAMANHO"
echo ""

# === CRIAR BACKUP ===
NOME_BACKUP="backup_$(basename "$PASTA_ORIGEM")_${DATA}.tar.gz"
CAMINHO_BACKUP="$BACKUP_DIR/$NOME_BACKUP"

echo "Compactando..."
if tar -czf "$CAMINHO_BACKUP" -C "$(dirname "$PASTA_ORIGEM")" "$(basename "$PASTA_ORIGEM")" 2>/dev/null; then
    TAMANHO_BACKUP=$(du -sh "$CAMINHO_BACKUP" | cut -f1)
    log_ok "Backup criado: $NOME_BACKUP ($TAMANHO_BACKUP)"
else
    log_err "Falha ao criar backup"
fi

# === LIMPAR BACKUPS ANTIGOS ===
echo ""
echo "Removendo backups com mais de ${RETENCAO_DIAS} dias..."

REMOVIDOS=0
while IFS= read -r arquivo; do
    rm -f "$arquivo"
    REMOVIDOS=$((REMOVIDOS + 1))
    log_warn "Removido: $(basename "$arquivo")"
done < <(find "$BACKUP_DIR" -name "backup_*.tar.gz" -mtime +$RETENCAO_DIAS -type f 2>/dev/null)

if [ "$REMOVIDOS" -eq 0 ]; then
    echo "  Nenhum backup antigo para remover."
fi

# === LISTAR BACKUPS EXISTENTES ===
echo ""
echo "Backups existentes:"
ls -lh "$BACKUP_DIR"/backup_*.tar.gz 2>/dev/null | awk '{print "  " $9 " (" $5 ")"}'
TOTAL_BACKUPS=$(ls "$BACKUP_DIR"/backup_*.tar.gz 2>/dev/null | wc -l)

# === LOG ===
echo "$DATA | $PASTA_ORIGEM | $TOTAL_ARQUIVOS arquivos | $TAMANHO | $NOME_BACKUP" >> "$LOG_FILE"

echo ""
echo "=========================================="
log_ok "Backup concluído! ($TOTAL_BACKUPS backups armazenados)"
echo "  Log: $LOG_FILE"
echo "=========================================="
