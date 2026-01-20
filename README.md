# Spotify Agentic System - Infrastructure

Este repositório centraliza a infraestrutura e orquestração dos serviços do **Spotify Agentic System**. O projeto utiliza **Docker** e **Docker Compose** para subir todo o ambiente de desenvolvimento, integrando Frontend, Backend, MCP Server e Banco de Dados.

## 🏗️ Arquitetura e Serviços

O sistema é composto pelos seguintes contêineres:

| Serviço | Tecnologia | Porta Host | Descrição |
| :--- | :--- | :--- | :--- |
| **Frontend** | Nuxt.js | `3000` | Interface do usuário. Acessível em [http://localhost:3000](http://localhost:3000). |
| **Backend** | FastAPI (Python) | `8000` | API principal e lógica do agente. Docs em [http://localhost:8000/api/docs](http://localhost:8000/api/docs). |
| **MCP Server** | Node.js | `3000` | Servidor MCP (Model Context Protocol) para integração com Spotify. |
| **Database** | PostgreSQL 15 | `5432` | Banco de dados persistente. |

## 🚀 Pré-requisitos

Certifique-se de ter instalado em sua máquina:
- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## 🛠️ Configuração Inicial

### 1. Preparar Repositórios

Se você ainda não possui os repositórios dos serviços (Frontend, Backend, MCP) baixados, utilize o script de setup.

```bash
# Dar permissão e executar
chmod +x setup_repos.sh
./setup_repos.sh
```

### 2. Configurações Individuais dos Serviços

Cada serviço possui suas próprias configurações. Acesse os diretórios (ou links dos repositórios) para configurar seus respectivos `.env`:

| Serviço | Diretório | Arquivo de Configuração |
| :--- | :--- | :--- |
| **Backend** | `./spotify-agentic-system-backend` | Copie `.env.example` para `.env` dentro da pasta. |
| **MCP Server** | `./spotify-mcp-server` | Configure o `spotify-config.json`. |

### 3. Variáveis de Ambiente da Infra (Docker)

Configure o arquivo `.env` na raiz deste repositório (infra):

1. Copie o arquivo de exemplo:
   ```bash
   cp .env.example .env
   ```
   
2. Edite o arquivo `.env` com suas credenciais do Postgres.

## 💾 Banco de Dados

O banco de dados será populado automaticamente na primeira inicialização (seed), caso esteja vazio. O script de inicialização do backend verifica a existência de dados antes de executar a importação.

## ▶️ Inicializando a Infraestrutura


Para subir todo o ambiente em modo de desenvolvimento (com *hot-reload* ativado onde aplicável), execute:

```bash
docker compose up --build
```

- A flag `--build` garante que as imagens sejam recriadas caso tenha havido alterações nos Dockerfiles ou dependências.
- Para rodar em segundo plano (detached), use `docker-compose up -d`.

## 🔍 Detalhes da Rede

Todos os serviços se comunicam através da rede interna `spotify_net`.
- O **Backend** acessa o banco via hostname `db`.
- O **Backend** acessa o MCP via hostname `mcp`.
- O **Frontend** acessa o Backend via `http://localhost:8000` (browser) ou comunicação interna server-side se configurado na mesma rede.

---
**Observação:** Este ambiente é configurado para **desenvolvimento**. Não utilize estas configurações (senhas fracas, modo debug) em produção.
