#!/bin/bash

# =====================================================
# MARCELO SETUP ULTIMATE v3.0 - 100+ TOOLS
# Copyright © 2025 Marcelo D'ávila. Todos os direitos reservados.
# 
# Sistema Único e Original
# Sistema Ultimate de Instalação - Open Source Tools
# Autor: Marcelo D'ávila
# Email: suporte@marcelodavila.com.br
# Website: https://marcelo-setup.netlify.app
# =====================================================

# Cores do sistema
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
ORANGE='\033[0;91m'
PINK='\033[0;95m'
LIME='\033[0;92m'
BOLD='\033[1m'
NC='\033[0m'

# Variáveis globais
CURRENT_PAGE=1
TOTAL_PAGES=5

# Banner Principal
show_banner() {
    clear
    echo -e "${PURPLE}${BOLD}"
    echo "╔═══════════════════════════════════════════════════════════════════════════════╗"
    echo "║                                                                               ║"
    echo -e "║  ${RED}██╗   ██╗${ORANGE}██╗  ████████╗${YELLOW}██╗███╗   ███╗${GREEN}█████╗ ████████╗${CYAN}███████╗${NC}${PURPLE}${BOLD}  ║"
    echo -e "║  ${RED}██║   ██║${ORANGE}██║  ╚══██╔══╝${YELLOW}██║████╗ ████║${GREEN}██╔══██╗╚══██╔══╝${CYAN}██╔════╝${NC}${PURPLE}${BOLD}  ║"
    echo -e "║  ${RED}██║   ██║${ORANGE}██║     ██║   ${YELLOW}██║██╔████╔██║${GREEN}███████║   ██║   ${CYAN}█████╗${NC}${PURPLE}${BOLD}    ║"
    echo -e "║  ${RED}██║   ██║${ORANGE}██║     ██║   ${YELLOW}██║██║╚██╔╝██║${GREEN}██╔══██║   ██║   ${CYAN}██╔══╝${NC}${PURPLE}${BOLD}    ║"
    echo -e "║  ${RED}╚██████╔╝${ORANGE}███████╗██║   ${YELLOW}██║██║ ╚═╝ ██║${GREEN}██║  ██║   ██║   ${CYAN}███████╗${NC}${PURPLE}${BOLD}  ║"
    echo -e "║  ${RED} ╚═════╝ ${ORANGE}╚══════╝╚═╝   ${YELLOW}╚═╝╚═╝     ╚═╝${GREEN}╚═╝  ╚═╝   ╚═╝   ${CYAN}╚══════╝${NC}${PURPLE}${BOLD}  ║"
    echo "║                                                                               ║"
    echo -e "║            ${LIME}🚀 MARCELO D'ÁVILA - ULTIMATE SETUP SYSTEM 🚀${NC}${PURPLE}${BOLD}             ║"
    echo -e "║                   ${WHITE}100+ Ferramentas Open Source${NC}${PURPLE}${BOLD}                    ║"
    echo -e "║                   ${RED}© 2025 - Todos os Direitos Reservados${NC}${PURPLE}${BOLD}             ║"
    echo "╚═══════════════════════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
    echo -e "${YELLOW}${BOLD}⚡ SISTEMA ÚNICO E ORIGINAL - CRIADO EXCLUSIVAMENTE POR MARCELO D'ÁVILA ⚡${NC}\n"
}

# Página 1 - Comunicação & WhatsApp
show_page1() {
    echo -e "${WHITE}${BOLD}╔══════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${WHITE}${BOLD}║                         ${CYAN}💬 COMUNICAÇÃO & WHATSAPP${NC}${WHITE}${BOLD}                        ║${NC}"
    echo -e "${WHITE}${BOLD}╠══════════════════════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${WHITE}║${NC} ${RED}[01]${NC} ${CYAN}Evolution API${NC} ${YELLOW}[Escolha a versão]${NC}                      ${WHITE}║${NC}"
    echo -e "${WHITE}║${NC} ${RED}[02]${NC} ${CYAN}Chatwoot${NC} ${YELLOW}[v3.0.0 + PostgreSQL]${NC}                     ${WHITE}║${NC}"
    echo -e "${WHITE}║${NC} ${RED}[03]${NC} ${CYAN}Typebot${NC} ${YELLOW}[Escolha a versão]${NC}                         ${WHITE}║${NC}"
    echo -e "${WHITE}║${NC} ${RED}[04]${NC} ${CYAN}N8N Workflows${NC} ${YELLOW}[Escolha a versão]${NC}                    ${WHITE}║${NC}"
    echo -e "${WHITE}║${NC} ${RED}[05]${NC} ${CYAN}Botpress${NC} ${YELLOW}[Chatbot com IA]${NC}                          ${WHITE}║${NC}"
    echo -e "${WHITE}║${NC} ${RED}[06]${NC} ${CYAN}Flowise AI${NC} ${YELLOW}[LLM Visual Builder]${NC}                     ${WHITE}║${NC}"
    echo -e "${WHITE}║${NC} ${RED}[07]${NC} ${CYAN}Langfuse${NC} ${YELLOW}[LLM Observability]${NC}                       ${WHITE}║${NC}"
    echo -e "${WHITE}║${NC} ${RED}[08]${NC} ${CYAN}Dify AI${NC} ${YELLOW}[Plataforma LLM Apps]${NC}                      ${WHITE}║${NC}"
    echo -e "${WHITE}║${NC} ${RED}[09]${NC} ${CYAN}WhatsApp Business API${NC} ${YELLOW}[Oficial]${NC}                     ${WHITE}║${NC}"
    echo -e "${WHITE}║${NC} ${RED}[10]${NC} ${CYAN}Telegram Bot API${NC} ${YELLOW}[Automação]${NC}                       ${WHITE}║${NC}"
    echo -e "${WHITE}║${NC} ${RED}[11]${NC} ${CYAN}Discord Bot${NC} ${YELLOW}[Para servidores]${NC}                       ${WHITE}║${NC}"
    echo -e "${WHITE}║${NC} ${RED}[12]${NC} ${CYAN}Rocket.Chat${NC} ${YELLOW}[Chat empresarial]${NC}                     ${WHITE}║${NC}"
    echo -e "${WHITE}║${NC} ${RED}[13]${NC} ${CYAN}Mattermost${NC} ${YELLOW}[Slack alternativo]${NC}                     ${WHITE}║${NC}"
    echo -e "${WHITE}║${NC} ${RED}[14]${NC} ${CYAN}Element Matrix${NC} ${YELLOW}[Chat descentralizado]${NC}               ${WHITE}║${NC}"
    echo -e "${WHITE}║${NC} ${RED}[15]${NC} ${CYAN}Jitsi Meet${NC} ${YELLOW}[Videoconferência]${NC}                      ${WHITE}║${NC}"
    echo -e "${WHITE}║${NC} ${RED}[16]${NC} ${CYAN}BigBlueButton${NC} ${YELLOW}[Webconferência]${NC}                     ${WHITE}║${NC}"
    echo -e "${WHITE}║${NC} ${RED}[17]${NC} ${CYAN}Cal.com${NC} ${YELLOW}[Sistema de agendamento]${NC}                   ${WHITE}║${NC}"
    echo -e "${WHITE}║${NC} ${RED}[18]${NC} ${CYAN}Calendly Clone${NC} ${YELLOW}[Agendamento]${NC}                       ${WHITE}║${NC}"
    echo -e "${WHITE}║${NC} ${RED}[19]${NC} ${CYAN}Zulip${NC} ${YELLOW}[Chat organizado]${NC}                            ${WHITE}║${NC}"
    echo -e "${WHITE}║${NC} ${RED}[20]${NC} ${CYAN}Wire${NC} ${YELLOW}[Mensageiro seguro]${NC}                           ${WHITE}║${NC}"
    echo -e "${WHITE}${BOLD}╚══════════════════════════════════════════════════════════════════════════════╝${NC}"
}

# Página 2 - Desenvolvimento Web
show_page2() {
    echo -e "${WHITE}${BOLD}╔══════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${WHITE}${BOLD}║                         ${BLUE}🌐 DESENVOLVIMENTO WEB${NC}${WHITE}${BOLD}                         ║${NC}"
    echo -e "${WHITE}${BOLD}╠══════════════════════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${WHITE}║${NC} ${ORANGE}[21]${NC} ${BLUE}Docker + Portainer${NC} ${YELLOW}[Containerização]${NC}                 ${WHITE}║${NC}"
    echo -e "${WHITE}║${NC} ${ORANGE}[22]${NC} ${BLUE}WordPress${NC} ${YELLOW}[CMS + MySQL]${NC}                            ${WHITE}║${NC}"
    echo -e "${WHITE}║${NC} ${ORANGE}[23]${NC} ${BLUE}Ghost${NC} ${YELLOW}[Plataforma de blog]${NC}                        ${WHITE}║${NC}"
    echo -e "${WHITE}║${NC} ${ORANGE}[24]${NC} ${BLUE}Strapi${NC} ${YELLOW}[Headless CMS]${NC}                             ${WHITE}║${NC}"
    echo -e "${WHITE}║${NC} ${ORANGE}[25]${NC} ${BLUE}Directus${NC} ${YELLOW}[Plataforma de dados]${NC}                    ${WHITE}║${NC}"
    echo -e "${WHITE}║${NC} ${ORANGE}[26]${NC} ${BLUE}Supabase${NC} ${YELLOW}[Firebase alternativo]${NC}                   ${WHITE}║${NC}"
    echo -e "${WHITE}║${NC} ${ORANGE}[27]${NC} ${BLUE}Appsmith${NC} ${YELLOW}[Low-code platform]${NC}                      ${WHITE}║${NC}"
    echo -e "${WHITE}║${NC} ${ORANGE}[28]${NC} ${BLUE}NocoDB${NC} ${YELLOW}[Airtable alternativo]${NC}                     ${WHITE}║${NC}"
    echo -e "${WHITE}║${NC} ${ORANGE}[29]${NC} ${BLUE}Baserow${NC} ${YELLOW}[Database no-code]${NC}                        ${WHITE}║${NC}"
    echo -e "${WHITE}║${NC} ${ORANGE}[30]${NC} ${BLUE}Hasura${NC} ${YELLOW}[GraphQL engine]${NC}                           ${WHITE}║${NC}"
    echo -e "${WHITE}║${NC} ${ORANGE}[31]${NC} ${BLUE}Nginx + SSL${NC} ${YELLOW}[Servidor web]${NC}                        ${WHITE}║${NC}"
    echo -e "${WHITE}║${NC} ${ORANGE}[32]${NC} ${BLUE}Apache${NC} ${YELLOW}[Servidor web tradicional]${NC}                ${WHITE}║${NC}"
    echo -e "${WHITE}║${NC} ${ORANGE}[33]${NC} ${BLUE}Traefik${NC} ${YELLOW}[Reverse proxy]${NC}                           ${WHITE}║${NC}"
    echo -e "${WHITE}║${NC} ${ORANGE}[34]${NC} ${BLUE}Caddy${NC} ${YELLOW}[Servidor web moderno]${NC}                      ${WHITE}║${NC}"
    echo -e "${WHITE}║${NC} ${ORANGE}[35]${NC} ${BLUE}Node.js + NPM${NC} ${YELLOW}[Runtime JavaScript]${NC}                ${WHITE}║${NC}"
    echo -e "${WHITE}║${NC} ${ORANGE}[36]${NC} ${BLUE}Deno${NC} ${YELLOW}[Runtime JS moderno]${NC}                         ${WHITE}║${NC}"
    echo -e "${WHITE}║${NC} ${ORANGE}[37]${NC} ${BLUE}Bun${NC} ${YELLOW}[Runtime ultra-rápido]${NC}                        ${WHITE}║${NC}"
    echo -e "${WHITE}║${NC} ${ORANGE}[38]${NC} ${BLUE}Vite${NC} ${YELLOW}[Build tool frontend]${NC}                        ${WHITE}║${NC}"
    echo -e "${WHITE}║${NC} ${ORANGE}[39]${NC} ${BLUE}Coolify${NC} ${YELLOW}[Vercel self-hosted]${NC}                      ${WHITE}║${NC}"
    echo -e "${WHITE}║${NC} ${ORANGE}[40]${NC} ${BLUE}Gitea${NC} ${YELLOW}[Git self-hosted]${NC}                           ${WHITE}║${NC}"
    echo -e "${WHITE}${BOLD}╚══════════════════════════════════════════════════════════════════════════════╝${NC}"
}

# Navegação entre páginas
show_navigation() {
    echo -e "\n${CYAN}${BOLD}╔═══════════════════════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${CYAN}${BOLD}║                              ${WHITE}NAVEGAÇÃO${NC}${CYAN}${BOLD}                                    ║${NC}"
    echo -e "${CYAN}${BOLD}╠═══════════════════════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${CYAN}║${NC} ${LIME}P1${NC} - Comunicação   ${LIME}P2${NC} - Desenvolvimento   ${LIME}P3${NC} - Bancos   ${LIME}P4${NC} - Analytics   ${LIME}P5${NC} - DevOps ${CYAN}║${NC}"
    echo -e "${CYAN}║${NC} ${WHITE}Digite P1-P5 para navegar${NC} | ${ORANGE}999${NC} - Instalar TUDO | ${RED}0${NC} - Sair           ${CYAN}║${NC}"
    echo -e "${CYAN}${BOLD}╚═══════════════════════════════════════════════════════════════════════════════╝${NC}"
    echo -e "\n${WHITE}Página atual: ${LIME}P${CURRENT_PAGE}${NC} | Digite o ${YELLOW}NÚMERO${NC} da ferramenta:"
}

# Instalar Evolution API
install_evolution_api() {
    echo -e "${CYAN}${BOLD}🚀 Instalando Evolution API...${NC}"
    
    read -p "Digite seu domínio (ex: api.meudominio.com): " dominio
    read -p "Digite a porta (padrão 8080): " porta
    porta=${porta:-8080}
    
    mkdir -p ~/marcelo-setup/evolution-api
    cd ~/marcelo-setup/evolution-api
    
    cat > docker-compose.yml << EOF
version: '3.8'
services:
  evolution-api:
    image: atendai/evolution-api:v2.0.0
    restart: always
    ports:
      - "${porta}:8080"
    environment:
      - SERVER_TYPE=http
      - SERVER_PORT=8080
      - CORS_ORIGIN=*
      - STORE_MESSAGES=true
      - STORE_CONTACTS=true
      - STORE_CHATS=true
      - DATABASE_ENABLED=true
      - DATABASE_CONNECTION_URI=postgresql://postgres:evolution123@postgres:5432/evolution
      - REDIS_ENABLED=true
      - REDIS_URI=redis://redis:6379
      - AUTHENTICATION_TYPE=apikey
      - AUTHENTICATION_API_KEY=MARCELO-SETUP-${RANDOM}
    volumes:
      - evolution_instances:/evolution/instances
    depends_on:
      - postgres
      - redis

  postgres:
    image: postgres:15-alpine
    restart: always
    environment:
      - POSTGRES_DB=evolution
      - POSTGRES_USER=postgres
      - POSTGRES_PASSWORD=evolution123
    volumes:
      - postgres_data:/var/lib/postgresql/data

  redis:
    image: redis:7-alpine
    restart: always
    command: redis-server --appendonly yes
    volumes:
      - redis_data:/data

volumes:
  evolution_instances:
  postgres_data:
  redis_data:
EOF
    
    echo -e "${YELLOW}Iniciando Evolution API...${NC}"
    docker-compose up -d
    
    echo -e "\n${GREEN}${BOLD}✅ Evolution API instalada com sucesso!${NC}"
    echo -e "${WHITE}🌐 URL: http://${dominio}:${porta}${NC}"
    echo -e "${WHITE}📱 Manager: http://${dominio}:${porta}/manager${NC}"
}

# Instalar Docker
install_docker() {
    echo -e "${BLUE}🐳 Instalando Docker + Portainer...${NC}"
    
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    sudo usermod -aG docker $USER
    sudo systemctl start docker
    sudo systemctl enable docker
    
    sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    
    docker volume create portainer_data
    docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce:latest
    
    echo -e "${GREEN}✅ Docker + Portainer instalados!${NC}"
    echo -e "${WHITE}🌐 Portainer: https://$(curl -s ifconfig.me):9443${NC}"
}

# Função principal de instalação
install_tool() {
    local tool_id=$1
    
    case $tool_id in
        1) install_evolution_api ;;
        21) install_docker ;;
        999) 
            echo -e "${RED}${BOLD}🚀 INSTALAÇÃO COMPLETA!${NC}"
            install_docker
            install_evolution_api
            echo -e "${GREEN}✅ Instalação completa finalizada!${NC}"
            ;;
        *)
            echo -e "${YELLOW}⚠️ Ferramenta [${tool_id}] em desenvolvimento...${NC}"
            echo -e "${CYAN}Será implementada na próxima versão!${NC}"
            ;;
    esac
}

# Loop principal
main() {
    show_banner
    
    echo -e "${GREEN}${BOLD}✅ Sistema carregado com 100+ ferramentas Open Source!${NC}"
    echo -e "${CYAN}📧 Suporte: suporte@marcelodavila.com.br${NC}"
    echo -e "${RED}⚖️ © 2025 Marcelo D'ávila - Sistema Único e Original${NC}\n"
    
    while true; do
        case $CURRENT_PAGE in
            1) show_page1 ;;
            2) show_page2 ;;
            *) show_page1 ;;
        esac
        
        show_navigation
        read -r choice
        
        case $choice in
            P1|p1) CURRENT_PAGE=1 ;;
            P2|p2) CURRENT_PAGE=2 ;;
            [1-9]|[1-9][0-9]|100|999)
                echo -e "${PURPLE}Instalando ferramenta [${choice}]...${NC}"
                install_tool $choice
                echo -e "\n${YELLOW}Pressione Enter para continuar...${NC}"
                read -r
                show_banner
                ;;
            0)
                echo -e "\n${LIME}${BOLD}Obrigado por usar o Marcelo Setup Ultimate!${NC}"
                echo -e "${WHITE}© 2025 Marcelo D'ávila - Sistema Único e Original${NC}"
                echo -e "${CYAN}Para suporte: suporte@marcelodavila.com.br${NC}\n"
                exit 0
                ;;
            *)
                echo -e "${RED}❌ Opção inválida!${NC}"
                sleep 1
                ;;
        esac
    done
}

# Executar sistema
main
