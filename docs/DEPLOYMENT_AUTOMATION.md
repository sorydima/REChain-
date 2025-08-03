# Автоматизация развертывания REChain в российских ОС

## 🤖 Скрипты автоматического развертывания

### Универсальный скрипт установки
```bash
#!/bin/bash
# auto-deploy-rechain.sh - Автоматическое развертывание REChain

set -e

# Определение ОС
detect_os() {
    if [ -f /etc/astra_version ]; then
        echo "astra"
    elif [ -f /etc/redos-release ]; then
        echo "redos"
    elif [ -f /etc/altlinux-release ]; then
        echo "alt"
    elif [ -f /etc/rosa-release ]; then
        echo "rosa"
    elif grep -q "Elbrus" /proc/cpuinfo; then
        echo "elbrus"
    else
        echo "unknown"
    fi
}

# Установка для каждой ОС
install_rechain() {
    local os_type=$(detect_os)
    local base_url="https://github.com/sorydima/REChain-/releases/latest/download"
    
    case $os_type in
        "astra")
            echo "Установка для Astra Linux..."
            wget "$base_url/rechainonline-4.1.7-amd64.deb"
            sudo dpkg -i rechainonline-4.1.7-amd64.deb
            sudo apt-get install -f
            ;;
        "redos"|"alt"|"rosa")
            echo "Установка для $os_type..."
            wget "$base_url/rechainonline-4.1.7-1.x86_64.rpm"
            if command -v dnf &> /dev/null; then
                sudo dnf install rechainonline-4.1.7-1.x86_64.rpm
            elif command -v yum &> /dev/null; then
                sudo yum install rechainonline-4.1.7-1.x86_64.rpm
            else
                sudo rpm -i rechainonline-4.1.7-1.x86_64.rpm
            fi
            ;;
        "elbrus")
            echo "Установка для ОС Эльбрус..."
            wget "$base_url/rechainonline.AppImage"
            chmod +x rechainonline.AppImage
            sudo mv rechainonline.AppImage /opt/rechainonline/
            sudo ln -sf /opt/rechainonline/rechainonline.AppImage /usr/local/bin/rechainonline
            ;;
        *)
            echo "Универсальная установка через AppImage..."
            wget "$base_url/rechainonline.AppImage"
            chmod +x rechainonline.AppImage
            ./rechainonline.AppImage --appimage-integrate
            ;;
    esac
}

# Настройка после установки
post_install_config() {
    # Создание конфигурационной директории
    mkdir -p ~/.config/REChain/
    
    # Базовая конфигурация
    cat > ~/.config/REChain/config.json << EOF
{
    "language": "ru",
    "theme": "system",
    "notifications": true,
    "auto_update": true
}
EOF
    
    echo "REChain успешно установлен и настроен!"
}

# Основная функция
main() {
    echo "🇷🇺 Автоматическая установка REChain для российских ОС Linux"
    echo "============================================================"
    
    install_rechain
    post_install_config
    
    echo "✅ Установка завершена! Запустите REChain из меню приложений."
}

main "$@"
```

### Ansible Playbook для массового развертывания
```yaml
# rechain-deployment.yml
---
- name: Deploy REChain on Russian Linux Systems
  hosts: all
  become: yes
  vars:
    rechain_version: "4.1.7"
    base_url: "https://github.com/sorydima/REChain-/releases/latest/download"
    
  tasks:
    - name: Detect OS type
      set_fact:
        os_type: "{{ 'astra' if ansible_facts['distribution'] == 'Astra Linux' else
                     'redos' if ansible_facts['distribution'] == 'RED OS' else
                     'alt' if ansible_facts['distribution'] == 'ALT Linux' else
                     'rosa' if ansible_facts['distribution'] == 'ROSA' else
                     'elbrus' if 'elbrus' in ansible_facts['processor'][0]|lower else
                     'unknown' }}"
    
    - name: Install REChain on Astra Linux
      block:
        - name: Download DEB package
          get_url:
            url: "{{ base_url }}/rechainonline-{{ rechain_version }}-amd64.deb"
            dest: "/tmp/rechainonline.deb"
        - name: Install DEB package
          apt:
            deb: "/tmp/rechainonline.deb"
            state: present
      when: os_type == "astra"
    
    - name: Install REChain on RPM-based systems
      block:
        - name: Download RPM package
          get_url:
            url: "{{ base_url }}/rechainonline-{{ rechain_version }}-1.x86_64.rpm"
            dest: "/tmp/rechainonline.rpm"
        - name: Install RPM package
          package:
            name: "/tmp/rechainonline.rpm"
            state: present
      when: os_type in ["redos", "alt", "rosa"]
    
    - name: Install REChain via AppImage
      block:
        - name: Create installation directory
          file:
            path: /opt/rechainonline
            state: directory
            mode: '0755'
        - name: Download AppImage
          get_url:
            url: "{{ base_url }}/rechainonline.AppImage"
            dest: "/opt/rechainonline/rechainonline.AppImage"
            mode: '0755'
        - name: Create symlink
          file:
            src: "/opt/rechainonline/rechainonline.AppImage"
            dest: "/usr/local/bin/rechainonline"
            state: link
      when: os_type in ["elbrus", "unknown"]
    
    - name: Configure REChain
      template:
        src: rechain-config.j2
        dest: /etc/rechainonline/config.json
        mode: '0644'
    
    - name: Enable REChain service (if applicable)
      systemd:
        name: rechainonline
        enabled: yes
        state: started
      ignore_errors: yes
```

## 🏢 Корпоративные шаблоны развертывания

### Docker контейнер для тестирования
```dockerfile
# Dockerfile.russian-linux-test
FROM registry.altlinux.org/alt/alt:p10

# Установка зависимостей
RUN apt-get update && apt-get install -y \
    wget \
    curl \
    gtk3 \
    glib2 \
    sqlite3 \
    ca-certificates

# Создание пользователя
RUN useradd -m -s /bin/bash testuser

# Копирование пакета REChain
COPY rechainonline-4.1.7-1.x86_64.rpm /tmp/

# Установка REChain
RUN rpm -i /tmp/rechainonline-4.1.7-1.x86_64.rpm

# Настройка окружения
USER testuser
WORKDIR /home/testuser

# Точка входа
CMD ["/usr/bin/rechainonline", "--no-sandbox"]
```

### Kubernetes манифест
```yaml
# rechain-deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: rechain-deployment
  namespace: collaboration
spec:
  replicas: 3
  selector:
    matchLabels:
      app: rechain
  template:
    metadata:
      labels:
        app: rechain
    spec:
      containers:
      - name: rechain
        image: rechain/russian-linux:4.1.7
        ports:
        - containerPort: 8080
        env:
        - name: RECHAIN_LOCALE
          value: "ru_RU.UTF-8"
        - name: RECHAIN_THEME
          value: "russian"
        volumeMounts:
        - name: config
          mountPath: /etc/rechainonline
        - name: data
          mountPath: /var/lib/rechainonline
      volumes:
      - name: config
        configMap:
          name: rechain-config
      - name: data
        persistentVolumeClaim:
          claimName: rechain-data
---
apiVersion: v1
kind: Service
metadata:
  name: rechain-service
spec:
  selector:
    app: rechain
  ports:
  - port: 80
    targetPort: 8080
  type: LoadBalancer
```

## 🔧 Инструменты мониторинга

### Скрипт проверки состояния
```bash
#!/bin/bash
# health-check.sh

check_rechain_health() {
    local status=0
    
    echo "🔍 Проверка состояния REChain..."
    
    # Проверка процесса
    if pgrep -f rechainonline > /dev/null; then
        echo "✅ Процесс REChain запущен"
    else
        echo "❌ Процесс REChain не найден"
        status=1
    fi
    
    # Проверка сетевых подключений
    if ss -tulpn | grep -q rechainonline; then
        echo "✅ Сетевые подключения активны"
    else
        echo "⚠️  Нет активных сетевых подключений"
    fi
    
    # Проверка использования памяти
    local mem_usage=$(ps -o rss= -p $(pgrep rechainonline) 2>/dev/null | awk '{sum+=$1} END {print sum/1024}')
    if [ -n "$mem_usage" ]; then
        echo "📊 Использование памяти: ${mem_usage}MB"
        if (( $(echo "$mem_usage > 1000" | bc -l) )); then
            echo "⚠️  Высокое использование памяти"
        fi
    fi
    
    # Проверка логов на ошибки
    local error_count=$(journalctl -u rechainonline --since "1 hour ago" | grep -c ERROR || echo 0)
    if [ "$error_count" -gt 0 ]; then
        echo "⚠️  Найдено $error_count ошибок в логах за последний час"
        status=1
    else
        echo "✅ Ошибок в логах не найдено"
    fi
    
    return $status
}

# Отправка уведомлений
send_notification() {
    local message="$1"
    local status="$2"
    
    # Отправка в Telegram (если настроен)
    if [ -n "$TELEGRAM_BOT_TOKEN" ] && [ -n "$TELEGRAM_CHAT_ID" ]; then
        curl -s -X POST "https://api.telegram.org/bot$TELEGRAM_BOT_TOKEN/sendMessage" \
            -d chat_id="$TELEGRAM_CHAT_ID" \
            -d text="🖥️ REChain Health Check: $message"
    fi
    
    # Отправка по email (если настроен)
    if command -v mail &> /dev/null && [ -n "$ADMIN_EMAIL" ]; then
        echo "$message" | mail -s "REChain Health Check" "$ADMIN_EMAIL"
    fi
    
    # Запись в syslog
    logger -t rechain-health "$message"
}

# Основная функция
main() {
    if check_rechain_health; then
        send_notification "✅ REChain работает нормально" "ok"
        exit 0
    else
        send_notification "❌ Обнаружены проблемы с REChain" "error"
        exit 1
    fi
}

main "$@"
```

## 📊 Метрики и аналитика

### Prometheus метрики
```yaml
# rechain-metrics.yml
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: 'rechain'
    static_configs:
      - targets: ['localhost:9090']
    metrics_path: /metrics
    scrape_interval: 30s
    
rule_files:
  - "rechain_alerts.yml"

alerting:
  alertmanagers:
    - static_configs:
        - targets:
          - alertmanager:9093
```

### Grafana дашборд конфигурация
```json
{
  "dashboard": {
    "title": "REChain Russian Linux Monitoring",
    "panels": [
      {
        "title": "Active Users by OS",
        "type": "piechart",
        "targets": [
          {
            "expr": "rechain_active_users_by_os",
            "legendFormat": "{{os_type}}"
          }
        ]
      },
      {
        "title": "Memory Usage",
        "type": "graph",
        "targets": [
          {
            "expr": "rechain_memory_usage_bytes",
            "legendFormat": "Memory Usage"
          }
        ]
      },
      {
        "title": "Network Connections",
        "type": "stat",
        "targets": [
          {
            "expr": "rechain_network_connections_total"
          }
        ]
      }
    ]
  }
}
```

## 🔐 Безопасность и соответствие

### Скрипт аудита безопасности
```bash
#!/bin/bash
# security-audit.sh

perform_security_audit() {
    echo "🔒 Аудит безопасности REChain..."
    
    # Проверка прав доступа к файлам
    echo "Проверка прав доступа..."
    find /usr/share/rechainonline -type f -perm /o+w -exec echo "⚠️  Файл {} доступен для записи всем" \;
    
    # Проверка сетевых подключений
    echo "Проверка сетевых подключений..."
    ss -tulpn | grep rechainonline | while read line; do
        echo "🌐 $line"
    done
    
    # Проверка процессов
    echo "Проверка процессов..."
    ps aux | grep rechainonline | grep -v grep
    
    # Проверка логов на подозрительную активность
    echo "Анализ логов..."
    journalctl -u rechainonline --since "24 hours ago" | grep -i "failed\|error\|unauthorized" | head -10
    
    # Проверка сертификатов
    echo "Проверка сертификатов..."
    if [ -d ~/.config/REChain/crypto ]; then
        find ~/.config/REChain/crypto -name "*.pem" -exec openssl x509 -in {} -noout -dates \;
    fi
}

generate_compliance_report() {
    local report_file="rechain-compliance-$(date +%Y%m%d).txt"
    
    {
        echo "REChain Compliance Report - $(date)"
        echo "=================================="
        echo
        
        echo "ГОСТ Compliance:"
        echo "- Encryption: $(openssl version)"
        echo "- Certificates: $(find ~/.config/REChain/crypto -name "*.pem" | wc -l) found"
        echo
        
        echo "FSTEC Requirements:"
        echo "- Audit logging: $(systemctl is-active auditd)"
        echo "- Access controls: $(ls -la /usr/bin/rechainonline)"
        echo
        
        echo "Data Residency:"
        echo "- Config location: ~/.config/REChain/"
        echo "- Data location: ~/.local/share/REChain/"
        echo "- Logs location: ~/.local/share/REChain/logs/"
        
    } > "$report_file"
    
    echo "📋 Отчет сохранен в $report_file"
}

main() {
    perform_security_audit
    generate_compliance_report
}

main "$@"
```

Эти дополнительные файлы значительно расширяют возможности документации, добавляя:

1. **Автоматизацию развертывания** - скрипты для массовой установки
2. **Корпоративные инструменты** - Docker, Kubernetes, Ansible
3. **Мониторинг и метрики** - health checks, Prometheus, Grafana
4. **Безопасность и соответствие** - аудит, отчеты о соответствии

Хотите, чтобы я создал эти файлы?
</create_file>
