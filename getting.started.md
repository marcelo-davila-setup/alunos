🚀 Guia de Início Rápido
Sistema de Automação e IA v6.0
300+ Ferramentas Profissionais

👨‍💻 Desenvolvedor
Marcelo D'ávila
📧 Email: suporte@marcelodavila.com.br
© 2025 - Todos os direitos reservados

⚡ Instalação Express (5 minutos)
Método 1: Script Automático ⭐ Recomendado
bash
# Download e execução em uma linha
curl -sSL https://raw.githubusercontent.com/marcelodavila/automation-system/main/quick-start.sh | sudo bash
Método 2: Instalação Manual
bash
# 1. Clonar repositório
git clone https://github.com/marcelodavila/automation-system.git
cd automation-system

# 2. Executar instalação
sudo bash setup.sh

# 3. Inicialização rápida
sudo bash quick-start.sh
Método 3: Docker Compose Direto
bash
# 1. Baixar docker-compose
wget https://raw.githubusercontent.com/marcelodavila/automation-system/main/docker-compose.yml

# 2. Configurar ambiente
cp .env.example .env
nano .env  # Editar conforme necessário

# 3. Iniciar serviços
docker-compose up -d
🎯 Primeiros Passos (10 minutos)
1. Verificar Status dos Serviços
bash
# Ver todos os serviços
docker-compose ps

# Verificar logs
docker-compose logs -f

# Monitoramento de saúde
bash scripts/health-monitor.sh dashboard
2. Acessar os Serviços Principais
Serviço	URL	Usuário	Senha
🤖 Typebot Builder	http://SEU_IP:3001	admin	Configure no 1º acesso
🌐 Typebot Viewer	http://SEU_IP:3002	-	-
⚙️ N8N Workflows	http://SEU_IP:5678	admin	Veja no arquivo .env
📱 Evolution API	http://SEU_IP:8080	-	API Key necessária
💬 Chatwoot	http://SEU_IP:3000	admin	Configure no 1º acesso
☁️ MinIO Storage	http://SEU_IP:9001	minioadmin	Veja no arquivo .env
📊 Grafana	http://SEU_IP:3001	admin	Veja no arquivo .env
3. Configurar Credenciais Iniciais
bash
# Ver todas as credenciais salvas
cat /opt/credentials/*-credentials.txt

# Ou visualizar no sistema
sudo bash quick-start.sh --credentials
🤖 Criar Seu Primeiro Chatbot (15 minutos)
Passo 1: Acessar o Typebot Builder
Abra http://SEU_IP:3001
Faça login ou crie uma conta
Clique em "Criar novo bot"
Passo 2: Configurar Bot Básico
javascript
// Exemplo de fluxo básico:
1. Mensagem de Boas-vindas
   └── "Olá! Sou seu assistente virtual. Como posso ajudar?"

2. Menu de Opções
   ├── "1. Informações sobre produtos"
   ├── "2. Suporte técnico"
   └── "3. Falar com atendente"

3. Respostas Condicionais
   └── Baseadas na escolha do usuário
Passo 3: Integrar com WhatsApp
Configurar Evolution API:
bash
# Verificar se API está rodando
curl http://localhost:8080/manager/instances

# Criar nova instância
curl -X POST http://localhost:8080/manager/create-instance \
  -H "Content-Type: application/json" \
  -H "apikey: SUA_API_KEY" \
  -d '{
    "instanceName": "meu-bot",
    "integration": "WHATSAPP-BAILEYS"
  }'
Conectar WhatsApp:
Acesse: http://SEU_IP:8080/manager/qrcode/meu-bot
Escaneie o QR Code com WhatsApp
Aguarde conexão
Conectar ao Typebot:
No Typebot, vá em Integrações
Adicione webhook: http://SEU_IP:8080/webhook/typebot
Configure eventos de mensagem
🔄 Criar Seu Primeiro Workflow N8N (20 minutos)
Passo 1: Acessar N8N
Abra http://SEU_IP:5678
Faça login com credenciais do arquivo .env
Clique em "New Workflow"
Passo 2: Workflow WhatsApp + IA
json
{
  "name": "WhatsApp AI Bot",
  "nodes": [
    {
      "name": "Webhook WhatsApp",
      "type": "n8n-nodes-base.webhook",
      "parameters": {
        "path": "whatsapp-ai",
        "httpMethod": "POST"
      }
    },
    {
      "name": "Processar Mensagem",
      "type": "n8n-nodes-base.function",
      "parameters": {
        "functionCode": "return [{\n  json: {\n    from: $json.from,\n    message: $json.body,\n    timestamp: new Date().toISOString()\n  }\n}];"
      }
    },
    {
      "name": "OpenAI ChatGPT",
      "type": "n8n-nodes-base.openAi",
      "parameters": {
        "operation": "text",
        "prompt": "Responda como assistente virtual profissional em português: {{ $json.message }}",
        "maxTokens": 150
      }
    },
    {
      "name": "Enviar Resposta",
      "type": "n8n-nodes-base.httpRequest",
      "parameters": {
        "method": "POST",
        "url": "http://evolution-api:8080/message/sendText",
        "headers": {
          "apikey": "SUA_API_KEY"
        },
        "body": {
          "number": "{{ $json.from }}",
          "text": "{{ $node['OpenAI ChatGPT'].json.choices[0].text }}"
        }
      }
    }
  ]
}
Passo 3: Ativar e Testar
Clique em "Save" para salvar o workflow
Clique em "Activate" para ativar
Teste enviando mensagem no WhatsApp
Verifique logs em "Executions"
📊 Configurar Monitoramento (10 minutos)
Passo 1: Acessar Grafana
Abra http://SEU_IP:3001
Login: admin / senha do arquivo .env
Vá em "Dashboards" → "Import"
Passo 2: Importar Dashboards Prontos
bash
# Dashboards incluídos:
- Sistema Geral (CPU, RAM, Disco)
- Docker Containers
- PostgreSQL Metrics
- Redis Metrics
- N8N Workflows
- WhatsApp Evolution API
- Chatwoot Support
Passo 3: Configurar Alertas
Email (Gmail):
bash
# Editar .env
SMTP_HOST=smtp.gmail.com
SMTP_PORT=587
SMTP_USERNAME=seu-email@gmail.com
SMTP_PASSWORD=sua-senha-app
ALERT_EMAIL=suporte@marcelodavila.com.br
Slack:
bash
# Editar .env
SLACK_WEBHOOK_URL=https://hooks.slack.com/services/...
Reiniciar serviços:
bash
docker-compose restart
🔧 Comandos Úteis do Dia a Dia
Gerenciamento de Serviços
bash
# Ver status
docker-compose ps

# Parar todos
docker-compose down

# Iniciar todos
docker-compose up -d

# Reiniciar serviço específico
docker-compose restart typebot-builder

# Ver logs em tempo real
docker-compose logs -f n8n

# Ver uso de recursos
docker stats
Backup e Manutenção
bash
# Backup completo
sudo bash scripts/backup.sh --full

# Backup apenas bancos
sudo bash scripts/backup.sh --db-only

# Verificar saúde
bash scripts/health-monitor.sh check

# Dashboard de status
bash scripts/health-monitor.sh dashboard

# Atualizar sistema
sudo bash scripts/update-system.sh
Resolução de Problemas
bash
# Verificar logs de erro
docker-compose logs | grep ERROR

# Verificar espaço em disco
df -h

# Verificar uso de memória
free -h

# Limpar Docker
docker system prune -f

# Reiniciar Docker
sudo systemctl restart docker
🎯 Casos de Uso Práticos
1. Atendimento Automatizado E-commerce
mermaid
graph TD
    A[Cliente envia mensagem] --> B[Typebot identifica intenção]
    B --> C{Tipo de solicitação}
    C -->|Produto| D[Consulta catálogo MinIO]
    C -->|Pedido| E[Consulta banco PostgreSQL]
    C -->|Suporte| F[Abre ticket Chatwoot]
    D --> G[Resposta automática]
    E --> G
    F --> H[Agente humano]
2. Geração de Leads Qualificados
javascript
// N8N Workflow para qualificação
1. Webhook recebe contato
2. Envia formulário via WhatsApp
3. Processa respostas com IA
4. Classifica lead (quente/frio)
5. Encaminha para vendedor
6. Salva no CRM (Chatwoot)
3. Suporte Multinível
yaml
Nível 1: Bot Typebot
  - FAQs automáticas
  - Soluções simples
  - Coleta de informações

Nível 2: IA N8N + ChatGPT
  - Problemas complexos
  - Análise de contexto
  - Soluções personalizadas

Nível 3: Agente Chatwoot
  - Problemas críticos
  - Suporte especializado
  - Escalação manual
🔐 Segurança e Boas Práticas
Configurações Essenciais
bash
# 1. Alterar senhas padrão
nano .env
# Altere todas as senhas e chaves

# 2. Configurar firewall
sudo ufw enable
sudo ufw allow 22,80,443,3000:3002,5678,8080,9000:9001/tcp

# 3. SSL/TLS (produção)
sudo apt install certbot
sudo certbot --nginx -d seudominio.com

# 4. Backup automático
crontab -e
# Adicionar: 0 2 * * * /opt/automation-system/scripts/backup.sh
Monitoramento de Segurança
bash
# Verificar tentativas de login
docker-compose logs | grep "authentication"

# Monitorar uso de recursos
bash scripts/health-monitor.sh monitor

# Verificar integridade dos dados
bash scripts/backup.sh --verify
📈 Otimização de Performance
Para Pequenos Ambientes (4GB RAM)
yaml
# docker-compose.override.yml
version: '3.8'
services:
  postgres:
    command: postgres -c shared_buffers=256MB -c max_connections=50
  
  redis:
    command: redis-server --maxmemory 512mb
  
  n8n:
    environment:
      - N8N_EXECUTIONS_DATA_PRUNE=true
      - N8N_EXECUTIONS_DATA_MAX_AGE=7
Para Ambientes Médios (8GB+ RAM)
yaml
# Configurações otimizadas já inclusas no docker-compose.yml
# Ajuste conforme necessário em .env:
POSTGRES_MAX_CONNECTIONS=200
REDIS_MAX_MEMORY=1024mb
N8N_EXECUTIONS_DATA_MAX_AGE=30
BACKUP_RETENTION_DAYS=60
🆘 Solução de Problemas Comuns
Problema: Serviço não inicia
bash
# Verificar logs
docker-compose logs nome-do-servico

# Verificar porta em uso
sudo netstat -tulpn | grep PORTA

# Reiniciar serviço
docker-compose restart nome-do-servico
Problema: Erro de conexão com banco
bash
# Verificar status PostgreSQL
docker-compose exec postgres pg_isready

# Verificar credenciais
grep POSTGRES .env

# Resetar banco (CUIDADO!)
docker-compose down
docker volume rm postgres_data
docker-compose up -d
Problema: WhatsApp desconecta
bash
# Verificar instâncias Evolution
curl http://localhost:8080/instance/fetchInstances

# Reconectar
curl -X POST http://localhost:8080/instance/connect/sua-instancia

# Ver QR Code novamente
# Acesse: http://SEU_IP:8080/manager/qrcode/sua-instancia
Problema: N8N workflows param
bash
# Verificar logs N8N
docker-compose logs n8n

# Reiniciar N8N
docker-compose restart n8n

# Verificar webhooks
curl -X GET http://localhost:5678/webhook-test
📞 Suporte e Contato
📧 Suporte Principal
Email: suporte@marcelodavila.com.br
Resposta: Até 24 horas

📚 Recursos Adicionais
Documentação Completa: README.md
Logs do Sistema: /var/log/automation-*.log
Status dos Serviços: bash scripts/health-monitor.sh dashboard
🔧 Suporte Técnico Avançado
Para problemas complexos ou customizações:

Envie email com logs: docker-compose logs > logs.txt
Inclua arquivo .env (sem senhas)
Descreva o problema detalhadamente
Mencione versão: cat .version
🎉 Próximos Passos
Semana 1: Configuração Básica
✅ Instalar sistema
✅ Configurar primeiro chatbot
✅ Conectar WhatsApp
✅ Criar workflow básico
Semana 2: Automações Avançadas
🔄 Integrar com APIs externas
🔄 Configurar IA (ChatGPT/Gemini)
🔄 Personalizar respostas
🔄 Configurar alertas
Semana 3: Otimização
📊 Analisar métricas
🔧 Otimizar performance
🛡️ Melhorar segurança
💾 Configurar backups
Semana 4: Expansão
🚀 Adicionar mais canais
🎯 Implementar CRM
📈 Configurar analytics
🔄 Automatizar mais processos
📋 Checklist de Produção
Antes de Ir ao Ar
 Alterar todas as senhas padrão
 Configurar domínio e SSL
 Configurar backup automático
 Testar todos os workflows
 Configurar monitoramento
 Documentar processos customizados
 Treinar equipe
 Definir plano de contingência
Monitoramento Contínuo
 Verificar saúde diariamente
 Analisar métricas semanalmente
 Fazer backup e testar restauração
 Atualizar sistema mensalmente
 Revisar logs de segurança
 Otimizar performance conforme uso
🌟 Desenvolvido com ❤️ por Marcelo D'ávila

© 2025 - Todos os direitos reservados | Sistema de Automação e IA v6.0

Este sistema contém mais de 300 ferramentas profissionais integradas. Para suporte completo e customizações avançadas, entre em contato: suporte@marcelodavila.com.br

