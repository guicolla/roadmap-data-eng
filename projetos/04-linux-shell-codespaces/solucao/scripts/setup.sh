#!/bin/bash
# =============================================
# setup.sh — Configura ambiente de Data Engineering
# Uso: chmod +x setup.sh && ./setup.sh
# =============================================

set -e  # Para na primeira falha

# === CORES ===
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # Sem cor

# === FUNÇÕES ===
log_ok()   { echo -e "${GREEN}[OK]${NC} $1"; }
log_warn() { echo -e "${YELLOW}[AVISO]${NC} $1"; }
log_err()  { echo -e "${RED}[ERRO]${NC} $1"; }

echo "=========================================="
echo "  Setup — Ambiente Data Engineering"
echo "=========================================="
echo ""

# === 1. ATUALIZAR PACOTES ===
echo "1/5 Atualizando pacotes..."
if sudo apt-get update -qq > /dev/null 2>&1; then
    log_ok "Pacotes atualizados"
else
    log_warn "Falha ao atualizar pacotes (continuando...)"
fi

# === 2. INSTALAR FERRAMENTAS ===
echo ""
echo "2/5 Instalando ferramentas..."

PACOTES="python3 python3-pip git jq sqlite3 tree curl wget"

for pacote in $PACOTES; do
    if command -v "$pacote" > /dev/null 2>&1; then
        log_ok "$pacote já instalado"
    else
        echo "    Instalando $pacote..."
        if sudo apt-get install -y -qq "$pacote" > /dev/null 2>&1; then
            log_ok "$pacote instalado"
        else
            log_err "Falha ao instalar $pacote"
        fi
    fi
done

# === 3. CRIAR ESTRUTURA DE PASTAS ===
echo ""
echo "3/5 Criando estrutura de pastas..."

PASTAS=("data/raw" "data/processed" "data/backups" "scripts" "output" "logs")

for pasta in "${PASTAS[@]}"; do
    if [ -d "$pasta" ]; then
        log_warn "$pasta já existe"
    else
        mkdir -p "$pasta"
        log_ok "$pasta criada"
    fi
done

# === 4. CONFIGURAR VARIÁVEIS DE AMBIENTE ===
echo ""
echo "4/5 Configurando variáveis de ambiente..."

BASHRC="$HOME/.bashrc"

# Adicionar variáveis se não existirem
if ! grep -q "DATA_HOME" "$BASHRC" 2>/dev/null; then
    echo "" >> "$BASHRC"
    echo "# === Data Engineering Environment ===" >> "$BASHRC"
    echo "export DATA_HOME=\$HOME/data" >> "$BASHRC"
    echo "export SCRIPTS_HOME=\$HOME/scripts" >> "$BASHRC"
    echo "export LOGS_HOME=\$HOME/logs" >> "$BASHRC"
    echo 'export PATH=$SCRIPTS_HOME:$PATH' >> "$BASHRC"
    log_ok "Variáveis adicionadas ao .bashrc"
else
    log_warn "Variáveis já configuradas"
fi

# === 5. VERIFICAR INSTALAÇÃO ===
echo ""
echo "5/5 Verificando instalação..."

echo ""
echo "  Python:  $(python3 --version 2>/dev/null || echo 'não encontrado')"
echo "  Git:     $(git --version 2>/dev/null || echo 'não encontrado')"
echo "  SQLite:  $(sqlite3 --version 2>/dev/null | head -1 || echo 'não encontrado')"
echo "  jq:      $(jq --version 2>/dev/null || echo 'não encontrado')"

echo ""
echo "=========================================="
log_ok "Ambiente configurado com sucesso!"
echo ""
echo "Estrutura criada:"
tree -L 2 data/ scripts/ output/ logs/ 2>/dev/null || ls -R data/ scripts/ output/ logs/
echo "=========================================="
