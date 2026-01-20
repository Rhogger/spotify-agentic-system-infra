#!/bin/bash

# Definição dos repositórios (Configure as URLs corretas aqui)
REPO_FRONTEND="https://github.com/Rhogger/spotify-agentic-system-frontend.git"
REPO_BACKEND="https://github.com/Rhogger/spotify-agentic-system-backend.git"
REPO_MCP="https://github.com/Rhogger/spotify-mcp-server.git"
REPO_DSML="https://github.com/Rhogger/spotify-agentic-system-ds-ml.git"

# Nomes das pastas esperadas pelo docker-compose
DIR_FRONTEND="spotify-agentic-system-frontend"
DIR_BACKEND="spotify-agentic-system-backend"
DIR_MCP="spotify-mcp-server"
DIR_DSML="spotify-agentic-system-ds-ml"

echo "🔍 Verificando repositórios..."

# Função para clonar se não existir
check_and_clone() {
    local dir=$1
    local url=$2
    if [ ! -d "$dir" ]; then
        echo "📂 Pasta '$dir' não encontrada. Clonando..."
        git clone "$url" "$dir"
    else
        echo "✅ '$dir' já existe."
    fi
}

check_and_clone "$DIR_FRONTEND" "$REPO_FRONTEND"
check_and_clone "$DIR_BACKEND" "$REPO_BACKEND"
check_and_clone "$DIR_MCP" "$REPO_MCP"
check_and_clone "$DIR_DSML" "$REPO_DSML"

echo "🚀 Todos os repositórios estão prontos!"
echo "➡️  Agora configure os arquivos .env de cada projeto se necessário."
