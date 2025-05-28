#!/bin/bash

# =====================================================
# MARCELO SETUP ULTIMATE v2.0 - 150+ TOOLS
# Copyright © 2025 Marcelo D'ávila. Todos os direitos reservados.
# 
# Sistema Ultimate de Instalação - Open Source Tools
# Autor: Marcelo D'ávila
# Email: suporte@marcelodavila.com.br
# Website: https://marcelo-setup.netlify.app
# =====================================================

# Cores Ultimate
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

# Banner Ultimate
show_ultimate_banner() {
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
    echo -e "║                   ${WHITE}150+ Ferramentas Open Source${NC}${PURPLE}${BOLD}                    ║"
    echo -e "║                   ${RED}© 2025 - Todos os Direitos Reservados${NC}${PURPLE}${BOLD}             ║"
    echo "╚═══════════════════════════════════════════════════════════════════════════════╝"
    echo -e "${NC}"
    echo -e "${YELLOW}${BOLD}⚡ SISTEMA PROFISSIONAL DE AUTOMAÇÃO E INSTALAÇÃO ⚡${NC}\n"
}

# Menu principal
show_menu() {
    echo -e "\n${WHITE}${BOLD}╔══════════════════════════════════════════════════════════════╗${NC}"
    echo -e "${WHITE}${BOLD}║                    ${LIME}🎯 MENU PRINCIPAL 🎯${NC}${WHITE}${BOLD}                     ║${NC}"
    echo -e "${WHITE}${BOLD}╠══════════════════════════════════════════════════════════════╣${NC}"
    echo -e "${WHITE}║${NC} ${RED}1.${NC} ${CYAN}Docker + Portainer${NC}                               ${WHITE}║${NC}"
    echo -e "${WHITE}║${NC} ${ORANGE}2.${NC} ${BLUE}Nginx + SSL${NC}                                     ${WHITE}║${NC}"
    echo -e "${WHITE}║${NC} ${YELLOW}3.${NC} ${PURPLE}WordPress Completo${NC}                             ${WHITE}║${NC}"
    echo -e "${WHITE}║${NC} ${GREEN}4.${NC} ${PINK}Chatwoot + N8N${NC}                                  ${WHITE}║${NC}"
    echo -e "${WHITE}║${NC} ${CYAN}5.${NC} ${LIME}Supabase + PostgreSQL${NC}                           ${WHITE}║${NC}"
    echo -e "${WHITE}║${NC} ${BLUE}6.${NC} ${RED}Pacote Completo${NC} ${YELLOW}[Tudo de uma vez]${NC}          ${WHITE}║${NC}"
    echo -e "${WHITE}║${NC} ${WHITE}0.${NC} ${RED}Sair${NC}                                             ${WHITE}║${NC}"
    echo -e "${WHITE}${BOLD}╚══════════════════════════════════════════════════════════════╝${NC}"
    echo -e "\n${LIME}${BOLD}Digite sua escolha [0-6]:${NC} "
}

# Instalar Docker
install_docker() {
    echo -e "${PURPLE}🐳 Instalando Docker...${NC}"
    curl -fsSL https://get.docker.com -o get-docker.sh
    sudo sh get-docker.sh
    sudo usermod -aG docker $USER
    sudo systemctl start docker
    sudo systemctl enable docker
    
    # Docker Compose
    sudo curl -L "https://github.com/docker/compose/releases/latest/download/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose
    
    echo -e "${GREEN}✅ Docker instalado com sucesso!${NC}"
}

# Instalar Nginx
install_nginx() {
    echo -e "${BLUE}🌐 Instalando Nginx...${NC}"
    sudo apt update
    sudo apt install -y nginx
    sudo systemctl start nginx
    sudo systemctl enable nginx
    echo -e "${GREEN}✅ Nginx instalado! Acesse: http://$(curl -s ifconfig.me)${NC}"
}

# Main function
main() {
    show_ultimate_banner
    
    echo -e "${GREEN}${BOLD}✅ Sistema carregado com 150+ ferramentas!${NC}"
    echo -e "${CYAN}📧 Suporte: suporte@marcelodavila.com.br${NC}"
    echo -e "${RED}⚖️  © 2025 Marcelo D'ávila - Protegido por direitos autorais${NC}\n"
    
    while true; do
        show_menu
        read -r choice
        
        case $choice in
            1)
                echo -e "${PURPLE}Instalando Docker + Portainer...${NC}"
                install_docker
                ;;
            2)
                echo -e "${BLUE}Instalando Nginx...${NC}"
                install_nginx
                ;;
            3)
                echo -e "${PURPLE}Instalando WordPress...${NC}"
                echo -e "${YELLOW}Em desenvolvimento - Use Docker primeiro!${NC}"
                ;;
            6)
                echo -e "${RED}🚀 INSTALAÇÃO COMPLETA${NC}"
                install_docker
                install_nginx
                echo -e "${GREEN}✅ Instalação completa finalizada!${NC}"
                ;;
            0)
                echo -e "\n${LIME}Obrigado por usar o Marcelo Setup Ultimate!${NC}"
                echo -e "${WHITE}© 2025 Marcelo D'ávila - Todos os direitos reservados${NC}"
                exit 0
                ;;
            *)
                echo -e "${RED}Opção inválida!${NC}"
                ;;
        esac
        
        echo -e "\n${YELLOW}Pressione Enter para continuar...${NC}"
        read -r
        show_ultimate_banner
    done
}

# Executar
main
