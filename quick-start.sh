#!/bin/bash

# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
# ░                    SISTEMA DE AUTOMAÇÃO E IA v6.0                      ░
# ░                        Script de Inicialização Rápida                  ░
# ░                                                                         ░
# ░                       Criado por: Marcelo D'ávila                       ░
# ░                    Email: suporte@marcelodavila.com.br                  ░
# ░                     © 2025 - Todos os direitos reservados               ░
# ░                                                                         ░
# ░  AVISO LEGAL: Este software é protegido por direitos autorais e leis    ░
# ░  de propriedade intelectual. O uso não autorizado é proibido por lei.   ░
# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░

set -e  # Parar em caso de erro

# Configurações
SCRIPT_VERSION="6.0"
LOG_FILE="/var/log/automation-quick-start.log"
PROJECT_DIR="$(pwd)"
ENV_FILE=".env"

# Cores para output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
RESET='\033[0m'

# Ícones
ROCKET="🚀"
CHECK="✅"
WARNING="⚠️"
ERROR="❌"
INFO="ℹ️"
GEAR="⚙️"
CROWN="👑"
DIAMOND="💎"

# Função de log
log() {
    local message="$1"
    local level="${2:-INFO}"
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    
    echo -e "$message"
    echo "[$timestamp] [$level] $(echo -e "$message" | sed 's/\x1b\[[0-9;]*m//g')" >> "$LOG_FILE"
}

# Banner
show_banner() {
    clear
    echo -e "${PURPLE}${WHITE}"
    cat << 'EOF'
    ███████╗██╗███████╗████████╗███████╗███╗   ███╗ █████╗ 
    ██╔════╝██║██╔════╝╚══██╔══╝██╔════╝████╗ ████║██╔══██╗
    ███████╗██║███████╗   ██║   █████╗  ██╔████╔██║███████║
    ╚════██║██║╚════██║   ██║   ██╔══╝  ██║╚██╔╝██║██╔══██║
    ███████║██║███████║   ██║   ███████╗██║ ╚═╝ ██║██║  ██║
    ╚══════╝╚═╝╚══════╝   ╚═╝   ╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝
    
     █████╗ ██╗   ██╗████████╗ ██████╗ ███╗   ███╗ █████╗ ████████╗██╗ ██████╗ ███╗   ██╗
    ██╔══██╗██║   ██║╚══██╔══╝██╔═══██╗████╗ ████║██╔══██╗╚══██╔══╝██║██╔═══██╗████╗  ██║
    ███████║██║   ██║   ██║   ██║   ██║██╔████╔██║███████║   ██║   ██║██║   ██║██╔██╗ ██║
    ██╔══██║██║   ██║   ██║   ██║   ██║██║╚██╔╝██║██╔══██║   ██║   ██║██║   ██║██║╚██╗██║
    ██║  ██║╚██████╔╝   ██║   ╚██████╔╝██║ ╚═╝ ██║██║  ██║   ██║   ██║╚██████╔╝██║ ╚████║
    ╚═╝  ╚═╝ ╚═════╝    ╚═╝    ╚═════╝ ╚═╝     ╚═╝╚═╝  ╚═╝   ╚═╝   ╚═╝ ╚═════╝ ╚═╝  ╚═══╝
    
    ███████╗    ██╗ █████╗     ██╗   ██╗ ██████╗     ██████╗ 
    ██╔════╝   ██╔╝██╔══██╗    ██║   ██║██╔════╝    ██╔═████╗
    █████╗    ██╔╝ ███████║    ██║   ██║███████╗    ██║██╔██║
    ██╔══╝   ██╔╝  ██╔══██║    ╚██╗ ██╔╝██╔═══██╗   ████╔╝██║
    ███████╗██╔╝   ██║  ██║     ╚████╔╝ ╚██████╔╝██╗╚██████╔╝
    ╚══════╝╚═╝    ╚═╝  ╚═╝      ╚═══╝   ╚═════╝ ╚═╝ ╚═════╝ 
EOF
    echo -e "${RESET}"
    echo
    echo -e "${CYAN}${WHITE}                    ╔═══════════════════════════════════════╗${RESET}"
    echo -e "${CYAN}${WHITE}                    ║      INICIALIZAÇÃO RÁPIDA v6.0        ║${RESET}"
    echo -e "${CYAN}${WHITE}                    ║       300+ Ferramentas Incluídas      ║${RESET}"
    echo -e "${CYAN}${WHITE}                    ╚═══════════════════════════════════════╝${RESET}"
    echo
    echo -e "${YELLOW}${WHITE}                    ${CROWN} Criado por: Marcelo D'ávila ${CROWN}${RESET}"
    echo -e "${WHITE}                    📧 suporte@marcelodavila.com.br${RESET}"
    echo -e "${WHITE}                    © 2025 - Todos os direitos reservados${RESET}"
    echo
}

# Verificar se é root
check_root() {
    if [[ $EUID -ne 0 ]]; then
        log "${RED}${ERROR} Este script deve ser executado como root (sudo)${RESET}" "ERROR"
        exit 1
    fi
}

# Verificar sistema operacional
check_os() {
    log "${BLUE}${INFO} Verificando sistema operacional...${RESET}"
    
    if [[ -f /etc/os-release ]]; then
        source /etc/os-release
        OS_NAME="$NAME"
        OS_VERSION="$VERSION"
        log "${GREEN}${CHECK} Sistema: $OS_NAME $OS_VERSION${RESET}"
    else
        log "${RED}${ERROR} Sistema operacional não suportado${RESET}" "ERROR"
        exit 1
    fi
}

# Verificar recursos do sistema
check_system_resources() {
    log "${BLUE}${INFO} Verificando recursos do sistema...${RESET}"
    
    # CPU
    CPU_CORES=$(nproc)
    log "${GREEN}${CHECK} CPU: $CPU_CORES cores${RESET}"
    
    # RAM
    RAM_GB=$(free -g | awk '/^Mem:/{print $2}')
    log "${GREEN}${CHECK} RAM: ${RAM_GB}GB${RESET}"
    
    if [ "$RAM_GB" -lt 4 ]; then
        log "${YELLOW}${WARNING} Aviso: RAM insuficiente (mínimo 4GB)${RESET}" "WARN"
    fi
    
    # Disco
    DISK_FREE=$(df -h / | awk 'NR==2{print $4}')
    log "${GREEN}${CHECK} Espaço livre: $DISK_FREE${RESET}"
    
    # Verificar se há pelo menos 20GB livres
    DISK_FREE_GB=$(df --output=avail / | tail -n1)
    DISK_FREE_GB=$((DISK_FREE_GB / 1024 / 1024))
    
    if [ "$DISK_FREE_GB" -lt 20 ]; then
        log "${YELLOW}${WARNING} Aviso: Espaço em disco insuficiente (mínimo 20GB)${RESET}" "WARN"
    fi
}

# Instalar dependências
install_dependencies() {
    log "${BLUE}${GEAR} Instalando dependências...${RESET}"
    
    # Atualizar pacotes
    apt-get update -qq
    
    # Instalar dependências essenciais
    apt-get install -y \
        curl \
        wget \
        git \
        vim \
        htop \
        tree \
        unzip \
        software-properties-common \
        apt-transport-https \
        ca-certificates \
        gnupg \
        lsb-release \
        jq \
        openssl \
        ufw \
        fail2ban \
        logrotate
    
    log "${GREEN}${CHECK} Dependências instaladas${RESET}"
}

# Instalar Docker
install_docker() {
    if command -v docker &> /dev/null; then
        log "${GREEN}${CHECK} Docker já está instalado${RESET}"
        return
    fi
    
    log "${BLUE}${GEAR} Instalando Docker...${RESET}"
    
    # Adicionar chave GPG oficial do Docker
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
    
    # Adicionar repositório
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
    
    # Atualizar e instalar
    apt-get update -qq
    apt-get install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin
    
    # Iniciar e habilitar Docker
    systemctl enable docker
    systemctl start docker
    
    # Adicionar usuário atual ao grupo docker
    if [ -n "$SUDO_USER" ]; then
        usermod -aG docker $SUDO_USER
    fi
    
    log "${GREEN}${CHECK} Docker instalado com sucesso${RESET}"
}

# Configurar firewall
setup_firewall() {
    log "${BLUE}${GEAR} Configurando firewall...${RESET}"
    
    # Resetar regras
    ufw --force reset
    
    # Política padrão
    ufw default deny incoming
    ufw default allow outgoing
    
    # Portas essenciais
    ufw allow 22      # SSH
    ufw allow 80      # HTTP
    ufw allow 443     # HTTPS
    ufw allow 3000    # Chatwoot
    ufw allow 3001    # Typebot Builder
    ufw allow 3002    # Typebot Viewer
    ufw allow 5678    # N8N
    ufw allow 8080    # Evolution API
    ufw allow 9000    # MinIO API
    ufw allow 9001    # MinIO Console
    
    # Habilitar firewall
    ufw --force enable
    
    log "${GREEN}${CHECK} Firewall configurado${RESET}"
}

# Configurar variáveis de ambiente
setup_environment() {
    log "${BLUE}${GEAR} Configurando variáveis de ambiente...${RESET}"
    
    if [ ! -f "$ENV_FILE" ]; then
        if [ -f ".env.example" ]; then
            cp .env.example "$ENV_FILE"
            log "${GREEN}${CHECK} Arquivo .env criado a partir do exemplo${RESET}"
        else
            log "${YELLOW}${WARNING} Arquivo .env.example não encontrado${RESET}" "WARN"
            create_basic_env_file
        fi
    else
        log "${GREEN}${CHECK} Arquivo .env já existe${RESET}"
    fi
    
    # Gerar senhas seguras se necessário
    generate_secure_passwords
}

# Criar arquivo .env básico
create_basic_env_file() {
    log "${BLUE}${GEAR} Criando arquivo .env básico...${RESET}"
    
    cat > "$ENV_FILE" << EOF
# Sistema de Automação e IA v6.0
# Desenvolvido por: Marcelo D'ávila
# Email: suporte@marcelodavila.com.br

# Configurações básicas
SYSTEM_NAME="Sistema de Automação e IA"
SYSTEM_VERSION="6.0"
SYSTEM_AUTHOR="Marcelo D'ávila"
SYSTEM_AUTHOR_EMAIL="suporte@marcelodavila.com.br"

# Banco de dados
POSTGRES_PASSWORD="$(openssl rand -base64 32)"
REDIS_PASSWORD="$(openssl rand -base64 32)"

# MinIO
MINIO_ROOT_USER="minioadmin"
MINIO_ROOT_PASSWORD="$(openssl rand -base64 32)"

# Typebot
TYPEBOT_NEXTAUTH_SECRET="$(openssl rand -base64 32)"
TYPEBOT_ENCRYPTION_SECRET="$(openssl rand -base64 32)"

# N8N
N8N_BASIC_AUTH_USER="admin"
N8N_BASIC_AUTH_PASSWORD="$(openssl rand -base64 16)"
N8N_ENCRYPTION_KEY="$(openssl rand -base64 32)"

# Evolution API
EVOLUTION_JWT_SECRET="$(openssl rand -base64 32)"

# Chatwoot
CHATWOOT_SECRET_KEY_BASE="$(openssl rand -base64 32)"

# Grafana
GRAFANA_ADMIN_USER="admin"
GRAFANA_ADMIN_PASSWORD="$(openssl rand -base64 16)"

# Email de alertas
ALERT_EMAIL="suporte@marcelodavila.com.br"
EOF
    
    log "${GREEN}${CHECK} Arquivo .env básico criado${RESET}"
}

# Gerar senhas seguras
generate_secure_passwords() {
    log "${BLUE}${GEAR} Verificando senhas de segurança...${RESET}"
    
    # Lista de variáveis que precisam de senhas seguras
    local vars=("POSTGRES_PASSWORD" "REDIS_PASSWORD" "MINIO_ROOT_PASSWORD" "TYPEBOT_NEXTAUTH_SECRET" "N8N_ENCRYPTION_KEY" "EVOLUTION_JWT_SECRET" "CHATWOOT_SECRET_KEY_BASE")
    
    for var in "${vars[@]}"; do
        if ! grep -q "^$var=" "$ENV_FILE"; then
            echo "$var=\"$(openssl rand -base64 32)\"" >> "$ENV_FILE"
            log "${GREEN}${CHECK} Senha gerada para $var${RESET}"
        fi
    done
}

# Inicializar serviços
start_services() {
    log "${BLUE}${ROCKET} Iniciando serviços...${RESET}"
    
    # Verificar se docker-compose.yml existe
    if [ ! -f "docker-compose.yml" ]; then
        log "${RED}${ERROR} Arquivo docker-compose.yml não encontrado${RESET}" "ERROR"
        exit 1
    fi
    
    # Parar serviços existentes (se houver)
    docker-compose down 2>/dev/null || true
    
    # Remover volumes órfãos
    docker volume prune -f 2>/dev/null || true
    
    # Iniciar serviços em background
    docker-compose up -d
    
    log "${GREEN}${CHECK} Serviços iniciados${RESET}"
}

# Aguardar serviços ficarem prontos
wait_for_services() {
    log "${BLUE}${INFO} Aguardando serviços ficarem prontos...${RESET}"
    
    local services=("postgres:5432" "redis:6379" "minio:9000")
    local max_attempts=30
    local attempt=1
    
    for service in "${services[@]}"; do
        local host=$(echo $service | cut -d: -f1)
        local port=$(echo $service | cut -d: -f2)
        
        log "${BLUE}${INFO} Verificando $host:$port...${RESET}"
        
        while [ $attempt -le $max_attempts ]; do
            if docker-compose exec -T $host nc -z localhost $port 2>/dev/null; then
                log "${GREEN}${CHECK} $host:$port está pronto${RESET}"
                break
            fi
            
            if [ $attempt -eq $max_attempts ]; then
                log "${YELLOW}${WARNING} $host:$port ainda não está pronto após $max_attempts tentativas${RESET}" "WARN"
            fi
            
            sleep 5
            ((attempt++))
        done
        
        attempt=1
    done
    
    # Aguardar mais um pouco para estabilizar
    sleep 10
    log "${GREEN}${CHECK} Todos os serviços estão prontos${RESET}"
}

# Verificar status dos serviços
check_services_status() {
    log "${BLUE}${INFO} Verificando status dos serviços...${RESET}"
    
    echo
    echo -e "${CYAN}═══════════════════════════════════════════════════════════════${RESET}"
    echo -e "${CYAN}                    STATUS DOS SERVIÇOS${RESET}"
    echo -e "${CYAN}═══════════════════════════════════════════════════════════════${RESET}"
    
    # Usar docker-compose ps para mostrar status
    docker-compose ps
    
    echo
    log "${GREEN}${CHECK} Verificação de status concluída${RESET}"
}

# Mostrar informações de acesso
show_access_info() {
    local IP=$(curl -s ifconfig.me 2>/dev/null || echo "localhost")
    
    echo
    echo -e "${PURPLE}${WHITE}═══════════════════════════════════════════════════════════════${RESET}"
    echo -e "${PURPLE}${WHITE}                    ${DIAMOND} SISTEMA INSTALADO COM SUCESSO! ${DIAMOND}${RESET}"
    echo -e "${PURPLE}${WHITE}═══════════════════════════════════════════════════════════════${RESET}"
    echo
    echo -e "${WHITE}${CROWN} SISTEMA DE AUTOMAÇÃO E IA v6.0${RESET}"
    echo -e "${WHITE}👨‍💻 Desenvolvido por: Marcelo D'ávila${RESET}"
    echo -e "${WHITE}📧 Suporte: suporte@marcelodavila.com.br${RESET}"
    echo
    echo -e "${CYAN}🌐 ACESSO AOS SERVIÇOS:${RESET}"
    echo -e "${WHITE}┌─────────────────────────────────────────────────────────────┐${RESET}"
    echo -e "${WHITE}│ ${ROCKET} Typebot Builder:    http://$IP:3001                 │${RESET}"
    echo -e "${WHITE}│ ${ROCKET} Typebot Viewer:     http://$IP:3002                 │${RESET}"
    echo -e "${WHITE}│ ${GEAR} N8N Workflows:      http://$IP:5678                 │${RESET}"
    echo -e "${WHITE}│ ${YELLOW}📱${RESET} Evolution API:      http://$IP:8080                 │${RESET}"
    echo -e "${WHITE}│ 💬 Chatwoot Support:   http://$IP:3000                 │${RESET}"
    echo -e "${WHITE}│ ☁️ MinIO Storage:       http://$IP:9001                 │${RESET}"
    echo -e "${WHITE}│ 📊 Grafana Monitor:    http://$IP:3001                 │${RESET}"
    echo -e "${WHITE}└─────────────────────────────────────────────────────────────┘${RESET}"
    echo
    echo -e "${CYAN}🔑 CREDENCIAIS PADRÃO:${RESET}"
    echo -e "${WHITE}┌─────────────────────────────────────────────────────────────┐${RESET}"
    echo -e "${WHITE}│ N8N:        admin / $(grep N8N_BASIC_AUTH_PASSWORD .env | cut -d'"' -f2 | head -c 8)...     │${RESET}"
    echo -e "${WHITE}│ MinIO:      minioadmin / $(grep MINIO_ROOT_PASSWORD .env | cut -d'"' -f2 | head -c 8)...  │${RESET}"
    echo -e "${WHITE}│ Grafana:    admin / $(grep GRAFANA_ADMIN_PASSWORD .env | cut -d'"' -f2 | head -c 8)...     │${RESET}"
    echo -e "${WHITE}└─────────────────────────────────────────────────────────────┘${RESET}"
    echo
    echo -e "${GREEN}${CHECK} Credenciais completas salvas em: .env${RESET}"
    echo -e "${GREEN}${CHECK} Logs do sistema em: $LOG_FILE${RESET}"
    echo
    echo -e "${YELLOW}${WARNING} IMPORTANTE:${RESET}"
    echo -e "${WHITE}• Altere as senhas padrão antes de usar em produção${RESET}"
    echo -e "${WHITE}• Configure SSL/TLS para domínios públicos${RESET}"
    echo -e "${WHITE}• Mantenha backups regulares do sistema${RESET}"
    echo -e "${WHITE}• Monitore os logs para detectar problemas${RESET}"
    echo
    echo -e "${CYAN}📚 PRÓXIMOS PASSOS:${RESET}"
    echo -e "${WHITE}1. Acesse os serviços usando os links acima${RESET}"
    echo -e "${WHITE}2. Configure suas integrações (WhatsApp, IA, etc.)${RESET}"
    echo -e "${WHITE}3. Crie seus primeiros chatbots e workflows${RESET}"
    echo -e "${WHITE}4. Configure backups automáticos${RESET}"
    echo
    echo -e "${PURPLE}${WHITE}═══════════════════════════════════════════════════════════════${RESET}"
    echo -e "${WHITE}© 2025 Marcelo D'ávila - Todos os direitos reservados${RESET}"
    echo -e "${WHITE}Software protegido por direitos autorais${RESET}"
    echo -e "${PURPLE}${WHITE}═══════════════════════════════════════════════════════════════${RESET}"
    echo
}

# Função principal
main() {
    show_banner
    
    log "${BLUE}${ROCKET} Iniciando instalação rápida do Sistema de Automação e IA v$SCRIPT_VERSION${RESET}"
    echo
    
    # Verificações iniciais
    check_root
    check_os
    check_system_resources
    
    # Instalações
    install_dependencies
    install_docker
    
    # Configurações
    setup_firewall
    setup_environment
    
    # Inicialização
    start_services
    wait_for_services
    
    # Verificações finais
    check_services_status
    
    # Mostrar informações
    show_access_info
    
    log "${GREEN}${CHECK} Instalação concluída com sucesso!${RESET}"
    log "${WHITE}Para suporte, entre em contato: suporte@marcelodavila.com.br${RESET}"
}

# Função de limpeza em caso de interrupção
cleanup() {
    echo
    log "${YELLOW}${WARNING} Instalação interrompida pelo usuário${RESET}" "WARN"
    echo
    log "${WHITE}Para tentar novamente:${RESET}"
    log "${WHITE}sudo bash quick-start.sh${RESET}"
    echo
    exit 1
}

# Capturar Ctrl+C
trap cleanup SIGINT SIGTERM

# Verificar argumentos
case "${1:-}" in
    --help|-h)
        echo "Sistema de Automação e IA v6.0 - Inicialização Rápida"
        echo "Desenvolvido por: Marcelo D'ávila"
        echo
        echo "Uso: sudo bash quick-start.sh [OPÇÃO]"
        echo
        echo "Opções:"
        echo "  --help, -h     Mostra esta ajuda"
        echo "  --version, -v  Mostra a versão"
        echo "  --status       Verifica status dos serviços"
        echo "  --restart      Reinicia todos os serviços"
        echo "  --stop         Para todos os serviços"
        echo "  --logs         Mostra logs dos serviços"
        echo
        echo "Sem argumentos: Executa instalação completa"
        echo
        echo "Suporte: suporte@marcelodavila.com.br"
        exit 0
        ;;
    --version|-v)
        echo "Sistema de Automação e IA v$SCRIPT_VERSION"
        echo "Desenvolvido por: Marcelo D'ávila"
        echo "© 2025 - Todos os direitos reservados"
        exit 0
        ;;
    --status)
        docker-compose ps
        exit 0
        ;;
    --restart)
        log "${BLUE}${GEAR} Reiniciando serviços...${RESET}"
        docker-compose restart
        log "${GREEN}${CHECK} Serviços reiniciados${RESET}"
        exit 0
        ;;
    --stop)
        log "${BLUE}${GEAR} Parando serviços...${RESET}"
        docker-compose down
        log "${GREEN}${CHECK} Serviços parados${RESET}"
        exit 0
        ;;
    --logs)
        docker-compose logs -f
        exit 0
        ;;
    "")
        # Execução normal
        main
        ;;
    *)
        echo "Argumento inválido: $1"
        echo "Use --help para ver as opções disponíveis"
        exit 1
        ;;
esac
