#!/bin/bash
# =============================================
# processa.sh — Processamento batch de CSVs
# Uso: ./processa.sh /caminho/dos/csvs
# =============================================

set -e

GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

log_ok()   { echo -e "${GREEN}[OK]${NC} $1"; }
log_warn() { echo -e "${YELLOW}[AVISO]${NC} $1"; }
log_err()  { echo -e "${RED}[ERRO]${NC} $1"; }
log_info() { echo -e "${BLUE}[INFO]${NC} $1"; }

RELATORIO="$HOME/output/relatorio_$(date +%Y-%m-%d).txt"

echo "=========================================="
echo "  Processamento Batch de CSVs"
echo "  Data: $(date '+%Y-%m-%d %H:%M:%S')"
echo "=========================================="
echo ""

# === VALIDAR ARGUMENTO ===
if [ -z "$1" ]; then
    log_err "Uso: $0 /caminho/dos/csvs"
    exit 1
fi

PASTA="$1"

if [ ! -d "$PASTA" ]; then
    log_err "Pasta '$PASTA' não encontrada"
    exit 1
fi

# === ENCONTRAR CSVs ===
CSVS=($(find "$PASTA" -name "*.csv" -type f | sort))

if [ ${#CSVS[@]} -eq 0 ]; then
    log_warn "Nenhum arquivo CSV encontrado em '$PASTA'"
    exit 0
fi

log_info "Encontrados ${#CSVS[@]} arquivo(s) CSV"
echo ""

# === CRIAR PASTA DE OUTPUT ===
mkdir -p "$HOME/output"

# === INICIAR RELATÓRIO ===
echo "=== Relatório de Processamento ===" > "$RELATORIO"
echo "Data: $(date '+%Y-%m-%d %H:%M:%S')" >> "$RELATORIO"
echo "Pasta: $PASTA" >> "$RELATORIO"
echo "Total de arquivos: ${#CSVS[@]}" >> "$RELATORIO"
echo "" >> "$RELATORIO"

TOTAL_LINHAS=0
TOTAL_TAMANHO=0

# === PROCESSAR CADA CSV ===
for csv in "${CSVS[@]}"; do
    NOME=$(basename "$csv")
    TAMANHO=$(du -h "$csv" | cut -f1)
    LINHAS=$(wc -l < "$csv")
    LINHAS_DADOS=$((LINHAS - 1))  # Sem header
    HEADER=$(head -1 "$csv")
    COLUNAS=$(echo "$HEADER" | awk -F',' '{print NF}')
    
    echo "──────────────────────────────────"
    echo -e "  Arquivo: ${GREEN}$NOME${NC}"
    echo "  Tamanho: $TAMANHO"
    echo "  Linhas:  $LINHAS_DADOS (+ 1 header)"
    echo "  Colunas: $COLUNAS"
    echo "  Header:  $HEADER"
    echo ""
    echo "  Preview (primeiras 3 linhas):"
    head -4 "$csv" | tail -3 | while IFS= read -r linha; do
        echo "    $linha"
    done
    echo ""
    
    # Adicionar ao relatório
    echo "--- $NOME ---" >> "$RELATORIO"
    echo "Tamanho: $TAMANHO | Linhas: $LINHAS_DADOS | Colunas: $COLUNAS" >> "$RELATORIO"
    echo "Header: $HEADER" >> "$RELATORIO"
    echo "" >> "$RELATORIO"
    
    TOTAL_LINHAS=$((TOTAL_LINHAS + LINHAS_DADOS))
    
    log_ok "$NOME processado"
done

# === RESUMO ===
echo ""
echo "=========================================="
echo "  RESUMO"
echo "=========================================="
echo "  Arquivos processados: ${#CSVS[@]}"
echo "  Total de linhas:      $TOTAL_LINHAS"
echo "  Relatório salvo em:   $RELATORIO"
echo "=========================================="
echo ""

# Finalizar relatório
echo "=== Resumo ===" >> "$RELATORIO"
echo "Arquivos processados: ${#CSVS[@]}" >> "$RELATORIO"
echo "Total de linhas: $TOTAL_LINHAS" >> "$RELATORIO"

log_ok "Processamento concluído!"
