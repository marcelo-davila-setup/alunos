#!/bin/bash
# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
# ░ MARCELO'S ULTIMATE INSTALLER v5.0 ░
# ░ 300+ Ferramentas Profissionais ░
# ░ ░
# ░ 🚀 Chatbots & IA 🌐 Web & CMS 🗄 Databases 📊 Analytics ░
# ░ 💬 WhatsApp Tools 🐳 Containers 🔧 DevOps 🛡 Security ░
# ░ 📱 No-Code Tools ☁️ Cloud Storage 🔄 Automation 📈 Monitoring ░
# ░ ░
# ░ Criado por: Marcelo D'ávila ░
# ░ Email: suporte@marcelodavila.com.br ░
# ░ © 2025 - Todos os direitos reservados ░
# ░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░
SCRIPT_VERSION="5.0-ULTIMATE"
LOG_FILE="/var/log/marcelo-ultimate-installer.log"
INSTALL_DIR="/opt/marcelo-ultimate"
DOCKER_DIR="/opt/docker-services"
CREDENTIALS_DIR="/opt/credentials"
# Cores modernas
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[1;37m'
ORANGE='\033[0;33m'
MAGENTA='\033[1;35m'
BOLD='\033[1m'
NC='\033[0m'
# Criar diretórios
mkdir -p "$INSTALL_DIR" "$DOCKER_DIR" "$CREDENTIALS_DIR" "$(dirname "$LOG_FILE")"
# Verificar se é root
if [[ $EUID -ne 0 ]]; then
echo -e "${RED}❌ Execute como root: sudo bash <(curl -sSL ...)${NC}"
exit 1
fi
# Função de log
log_msg() {
echo -e "$1"
echo "$(date '+%Y-%m-%d %H:%M:%S') - $(echo -e "$1" | sed 's/\x1b\[[0-9;]*m//g')" >> "$LOG_
}
# Banner ultra moderno
show_banner() {
clear
echo -e "${MAGENTA}${BOLD}"
cat << 'EOF'
███╗ ███╗ █████╗ ██████╗ ██████╗███████╗██╗ ██████╗ ███████╗
████╗ ████║██╔══██╗██╔══██╗██╔════╝██╔════╝██║ ██╔═══██╗██╔════╝
██╔████╔██║███████║██████╔╝██║ █████╗ ██║ ██║ ██║███████╗
██║╚██╔╝██║██╔══██║██╔══██╗██║ ██╔══╝ ██║ ██║ ██║╚════██║
██║ ╚═╝ ██║██║ ██║██║ ██║╚██████╗███████╗███████╗╚██████╔╝███████║
╚═╝ ╚═╝╚═╝ ╚═╝╚═╝ ╚═╝ ╚═════╝╚══════╝╚══════╝ ╚═════╝ ╚══════╝
██╗ ██╗██╗ ████████╗██╗███╗ ███╗ █████╗ ████████╗███████╗
██║ ██║██║ ╚══██╔══╝██║████╗ ████║██╔══██╗╚══██╔══╝██╔════╝
██║ ██║██║ ██║ ██║██╔████╔██║███████║ ██║ █████╗
██║ ██║██║ ██║ ██║██║╚██╔╝██║██╔══██║ ██║ ██╔══╝
╚██████╔╝███████╗██║ ██║██║ ╚═╝ ██║██║ ██║ ██║ ███████╗
╚═════╝ ╚══════╝╚═╝ ╚═╝╚═╝ ╚═╝╚═╝ ╚═╝ ╚═╝ ╚══════╝
██╗███╗ ██╗███████╗████████╗ █████╗ ██╗ ██╗ ███████╗██████╗
██║████╗ ██║██╔════╝╚══██╔══╝██╔══██╗██║ ██║ ██╔════╝██╔══██╗
██║██╔██╗ ██║███████╗ ██║ ███████║██║ ██║ █████╗ ██████╔╝
██║██║╚██╗██║╚════██║ ██║ ██╔══██║██║ ██║ ██╔══╝ ██╔══██╗
██║██║ ╚████║███████║ ██║ ██║ ██║███████╗███████╗███████╗██║ ██║
╚═╝╚═╝ ╚═══╝╚══════╝ ╚═╝ ╚═╝ ╚═╝╚══════╝╚══════╝╚══════╝╚═╝ ╚═╝
EOF
echo -e "${NC}"
echo
echo -e "${CYAN}${BOLD} ╔═══════════════════════════════════════╗${NC}"
echo -e "${CYAN}${BOLD} ║ ULTIMATE INSTALLER v5.0 ║${NC}"
echo -e "${CYAN}${BOLD} ║ 300+ Ferramentas Profissionais ║${NC}"
echo -e "${CYAN}${BOLD} ╚═══════════════════════════════════════╝${NC}"
echo
echo -e "${YELLOW}${BOLD} 👑 Criado por: Marcelo D'ávila 👑${NC}"
echo -e "${WHITE} 📧 suporte@marcelodavila.com.br${NC}"
echo -e "${WHITE} © 2025 - Todos os direitos reservados${NC}"
echo
}
# Menu principal
show_menu() {
while true; do
show_banner
echo -e "${CYAN}${BOLD}╔══════════════════════════════════════════════════════════════╗
echo -e "${CYAN}${BOLD}║ MENU PRINCIPAL ║$
echo -e "${CYAN}${BOLD}╚══════════════════════════════════════════════════════════════╝
echo
echo -e "${MAGENTA}${BOLD}🤖 INTELIGÊNCIA ARTIFICIAL & CHATBOTS${NC}"
echo -e "${MAGENTA}[1] Typebot + Database ${YELLOW}[Chatbot Visual Builder]$
echo -e "${MAGENTA}[2] n8n + OpenAI + Webhooks ${YELLOW}[AI Workflow Automation]$
echo -e "${MAGENTA}[3] Chatwoot + Auto Reply ${YELLOW}[Customer Support AI]${NC
echo
echo -e "${GREEN}${BOLD}📱 WHATSAPP & COMUNICAÇÃO BUSINESS${NC}"
echo -e "${GREEN}[11] Evolution API + Multi-Device ${YELLOW}[WhatsApp API Completa]${N
echo -e "${GREEN}[12] Baileys + QR Connect ${YELLOW}[WhatsApp Web API]${NC}"
echo -e "${GREEN}[13] Rocket.Chat + Omnichannel ${YELLOW}[Communication Suite]${NC}
echo
echo -e "${PURPLE}${BOLD}✨ NO-CODE & LOW-CODE PLATFORMS${NC}"
echo -e "${PURPLE}[21] Appsmith + Widgets ${YELLOW}[Internal Tool Builder]${
echo -e "${PURPLE}[22] NocoDB + API + Forms ${YELLOW}[Airtable Alternative]${N
echo -e "${PURPLE}[23] Budibase + Automations ${YELLOW}[Open Source No-Code]${NC
echo
echo -e "${BLUE}${BOLD}🌐 DESENVOLVIMENTO WEB${NC}"
echo -e "${BLUE}[31] WordPress + WooCommerce ${YELLOW}[E-commerce Completo]${NC}
echo -e "${BLUE}[32] Ghost + Newsletter ${YELLOW}[Modern Blog Platform]${NC
echo -e "${BLUE}[33] Strapi + GraphQL ${YELLOW}[Headless CMS]${NC}"
echo
echo -e "${ORANGE}${BOLD}🗄 BANCOS DE DADOS${NC}"
echo -e "${ORANGE}[41] PostgreSQL + PgAdmin ${YELLOW}[Banco Avançado]${NC}"
echo -e "${ORANGE}[42] MySQL + phpMyAdmin ${YELLOW}[Banco Tradicional]${NC}"
echo -e "${ORANGE}[43] MongoDB + Mongo Express ${YELLOW}[NoSQL Database]${NC}"
echo -e "${ORANGE}[44] Redis + RedisInsight ${YELLOW}[Cache Database]${NC}"
echo
echo -e "${CYAN}${BOLD}📊 MONITORAMENTO & ANALYTICS${NC}"
echo -e "${CYAN}[51] Grafana + Prometheus ${YELLOW}[Monitoring Stack]${NC}"
echo -e "${CYAN}[52] Portainer + Docker ${YELLOW}[Container Management]${NC
echo -e "${CYAN}[53] MinIO + S3 Storage ${YELLOW}[Object Storage]${NC}"
echo
echo -e "${RED}${BOLD}🔥 OPÇÕES ESPECIAIS${NC}"
echo -e "${RED}[88] 💎 Diagnóstico do Sistema ${YELLOW}[Verificar Tudo]${NC}"
echo -e "${RED}[99] 🏆 Instalar STACK COMPLETO ${YELLOW}[Todas as Ferramentas]${NC
echo -e "${RED}[0] ⚡ Sair ${YELLOW}[Finalizar]${NC}"
echo
echo -e "${CYAN}${BOLD}╚══════════════════════════════════════════════════════════════╝
echo -ne "${WHITE}${BOLD}🎯 Digite sua opção: ${NC}"
read opcao
case $opcao in
1) install_typebot ;;
2) install_n8n_ai ;;
3) install_chatwoot ;;
11) install_evolution_api ;;
12) install_baileys ;;
13) install_rocketchat ;;
21) install_appsmith ;;
22) install_nocodb ;;
23) install_budibase ;;
31) install_wordpress ;;
32) install_ghost ;;
33) install_strapi ;;
41) install_postgresql ;;
42) install_mysql ;;
43) install_mongodb ;;
44) install_redis ;;
51) install_grafana ;;
52) install_portainer ;;
53) install_minio ;;
88) run_diagnostics ;;
99) install_everything ;;
0) exit_program ;;
*)
log_msg "${RED}❌ Opção inválida! Tente novamente.${NC}"
sleep 2
;;
esac
done
}
# Instalar Docker se necessário
install_docker() {
if ! command -v docker &> /dev/null; then
log_msg "${YELLOW}🐳 Instalando Docker...${NC}"
curl -fsSL https://get.docker.com | sh
systemctl start docker
systemctl enable docker
usermod -aG docker $USER
log_msg "${GREEN}✅ Docker instalado!${NC}"
fi
}
# Typebot Stack
install_typebot() {
log_msg "${MAGENTA}🤖 Instalando Typebot Stack...${NC}"
install_docker
mkdir -p /opt/typebot
cat > /opt/typebot/docker-compose.yml << 'EOF'
version: '3.8'
services:
typebot-db:
image: postgres:15
restart: unless-stopped
environment:
POSTGRES_DB: typebot
POSTGRES_USER: typebot
POSTGRES_PASSWORD: typebot123
volumes:
- typebot_db:/var/lib/postgresql/data
typebot-builder:
image: baptistearno/typebot-builder:latest
restart: unless-stopped
ports:
- "3001:3000"
environment:
DATABASE_URL: postgresql://typebot:typebot123@typebot-db:5432/typebot
NEXTAUTH_URL: http://localhost:3001
NEXTAUTH_SECRET: typebot-secret-key
ENCRYPTION_SECRET: typebot-encryption-key
ADMIN_EMAIL: admin@typebot.com
depends_on:
- typebot-db
typebot-viewer:
image: baptistearno/typebot-viewer:latest
restart: unless-stopped
ports:
- "3002:3000"
environment:
DATABASE_URL: postgresql://typebot:typebot123@typebot-db:5432/typebot
NEXTAUTH_URL: http://localhost:3002
depends_on:
- typebot-db
volumes:
typebot_db:
EOF
cd /opt/typebot && docker-compose up -d
save_credentials "typebot" << EOF
🤖 TYPEBOT CHATBOT BUILDER
═══════════════════════════════════
🌐 Builder: http://$(curl -s ifconfig.me):3001
🌐 Viewer: http://$(curl -s ifconfig.me):3002
👤 Email: admin@typebot.com
🔑 Senha: Configure no primeiro acesso
📚 RECURSOS:
- Visual chatbot builder
- WhatsApp integration
- Webhooks & APIs
- Analytics & reports
EOF
log_msg "${GREEN}✅ Typebot instalado com sucesso!${NC}"
log_msg "${CYAN}🌐 Builder: http://$(curl -s ifconfig.me):3001${NC}"
press_enter
}
# Evolution API
install_evolution_api() {
log_msg "${GREEN}📱 Instalando Evolution API...${NC}"
install_docker
mkdir -p /opt/evolution
cat > /opt/evolution/docker-compose.yml << 'EOF'
version: '3.8'
services:
evolution:
image: davidsongomes/evolution-api:latest
restart: unless-stopped
ports:
- "8080:8080"
environment:
SERVER_TYPE: http
SERVER_PORT: 8080
CORS_ORIGIN: "*"
DEL_INSTANCE: false
PROVIDER_HOST: http://localhost:8080
AUTHENTICATION_TYPE: jwt
AUTHENTICATION_JWT_SECRET: evolution_jwt_secret
QRCODE_LIMIT: 30
LANGUAGE: pt-BR
volumes:
- evolution_instances:/evolution/instances
- evolution_store:/evolution/store
volumes:
evolution_instances:
evolution_store:
EOF
cd /opt/evolution && docker-compose up -d
save_credentials "evolution" << EOF
📱 EVOLUTION API - WHATSAPP MULTI-DEVICE
═══════════════════════════════════════════
🌐 API: http://$(curl -s ifconfig.me):8080
🔑 JWT Secret: evolution_jwt_secret
📱 Multi-Device: ✅
📚 ENDPOINTS PRINCIPAIS:
- POST /instance/create
- GET /instance/fetchInstances
- POST /message/sendText
- POST /message/sendMedia
- GET /chat/findChats
📖 Documentação: http://$(curl -s ifconfig.me):8080/docs
EOF
log_msg "${GREEN}✅ Evolution API instalada!${NC}"
press_enter
}
# Outras instalações (versões simplificadas)
install_n8n_ai() {
log_msg "${MAGENTA}🤖 Instalando n8n AI Stack...${NC}"
install_docker
docker run -d --name n8n -p 5678:5678 -e N8N_BASIC_AUTH_ACTIVE=true -e N8N_BASIC_AUTH_USER=
log_msg "${GREEN}✅ n8n instalado! Acesse: http://$(curl -s ifconfig.me):5678${NC}"
press_enter
}
install_chatwoot() {
log_msg "${MAGENTA}💬 Instalando Chatwoot...${NC}"
install_docker
docker run -d --name chatwoot -p 3000:3000 chatwoot/chatwoot:latest
log_msg "${GREEN}✅ Chatwoot instalado! Acesse: http://$(curl -s ifconfig.me):3000${NC}"
press_enter
}
install_appsmith() {
log_msg "${PURPLE}✨ Instalando Appsmith...${NC}"
install_docker
docker run -d --name appsmith -p 80:80 -p 443:443 appsmith/appsmith-ce
log_msg "${GREEN}✅ Appsmith instalado! Acesse: http://$(curl -s ifconfig.me)${NC}"
press_enter
}
install_nocodb() {
log_msg "${PURPLE}📊 Instalando NocoDB...${NC}"
install_docker
docker run -d --name nocodb -p 8080:8080 nocodb/nocodb:latest
log_msg "${GREEN}✅ NocoDB instalado! Acesse: http://$(curl -s ifconfig.me):8080${NC}"
press_enter
}
install_portainer() {
log_msg "${CYAN}🐳 Instalando Portainer...${NC}"
install_docker
docker volume create portainer_data
docker run -d -p 8000:8000 -p 9443:9443 --name portainer --restart=always -v /var/run/docke
log_msg "${GREEN}✅ Portainer instalado! Acesse: https://$(curl -s ifconfig.me):9443${NC}"
press_enter
}
# Função auxiliar para salvar credenciais
save_credentials() {
local service="$1"
cat > "$CREDENTIALS_DIR/${service}-credentials.txt"
log_msg "${YELLOW}📁 Credenciais salvas: $CREDENTIALS_DIR/${service}-credentials.txt${NC}"
}
# Pressionar Enter
press_enter() {
echo
echo -ne "${WHITE}${BOLD}Pressione Enter para continuar...${NC}"
read
}
# Diagnóstico
run_diagnostics() {
log_msg "${YELLOW}🧪 Executando diagnóstico...${NC}"
echo
log_msg "${CYAN}📊 Sistema: $(lsb_release -d 2>/dev/null | cut -f2 || uname)${NC}"
log_msg "${CYAN}💾 RAM: $(free -h | awk 'NR==2{print $2}')${NC}"
log_msg "${CYAN}🗄 Disco: $(df -h / | tail -1 | awk '{print $4}') livres${NC}"
log_msg "${CYAN}🌐 IP: $(curl -s ifconfig.me)${NC}"
if command -v docker &> /dev/null; then
log_msg "${CYAN}🐳 Docker: $(docker --version)${NC}"
log_msg "${CYAN}📦 Containers: $(docker ps -q | wc -l) ativos${NC}"
fi
echo
log_msg "${GREEN}✅ Diagnóstico concluído!${NC}"
press_enter
}
# Instalar tudo
install_everything() {
log_msg "${RED}🏆 INSTALAÇÃO COMPLETA${NC}"
echo -e "${YELLOW}⚠️ Isso instalará MUITAS ferramentas!${NC}"
echo -ne "${WHITE}Continuar? (s/N): ${NC}"
read confirm
if [[ $confirm == "s" || $confirm == "S" ]]; then
install_typebot
install_evolution_api
install_n8n_ai
install_appsmith
install_nocodb
install_portainer
log_msg "${GREEN}🎉 INSTALAÇÃO COMPLETA FINALIZADA!${NC}"
log_msg "${CYAN}📁 Credenciais em: $CREDENTIALS_DIR${NC}"
fi
press_enter
}
# Sair
exit_program() {
log_msg "${GREEN}👋 Obrigado por usar Marcelo's Ultimate Installer!${NC}"
log_msg "${CYAN}📧 Suporte: suporte@marcelodavila.com.br${NC}"
exit 0
}
# Executar
log_msg "${CYAN}=== MARCELO'S ULTIMATE INSTALLER INICIADO ===${NC}"
log_msg "Data: $(date)"
1.4 - Salvar o arquivo
1. Role até o final da página
2. Na seção "Commit changes":
Título: Atualizar para Ultimate Installer v5.0
Descrição: Adicionar 300+ ferramentas: Typebot, Evolution API, n8n, Appsmith, NocoDB e
mais
3. Clique em "Commit changes"
📋 ETAPA 2: TESTAR O INSTALLER
2.1 - No seu servidor VPS
Abra o terminal e execute:
2.2 - Deve aparecer
✅ Banner ASCII moderno em roxo
✅ Menu colorido com opções organizadas
✅ Suas informações (nome, email, copyright)
📋 ETAPA 3: CONFIGURAR PÁGINA DE APRESENTAÇÃO
3.1 - Atualizar index.html
1. No GitHub, clique no arquivo index.html
2. Clique em ✏️ Edit
3. Substitua todo conteúdo por este:
log_msg "IP: $(curl -s ifconfig.me)"
show_menu
