# REChain для РЕД ОС (RED OS)

## 🔴 Специальное руководство для РЕД ОС

РЕД ОС (RED OS) - это российская корпоративная операционная система, основанная на Red Hat Enterprise Linux. REChain полностью совместим с РЕД ОС и оптимизирован для корпоративного использования.

## 📋 Системные требования для РЕД ОС

### Поддерживаемые версии
- **РЕД ОС 7.3** и выше
- **РЕД ОС 8.x** (все версии)
- **РЕД ОС 9.x** (все версии)

### Архитектуры
- x86_64 (Intel/AMD 64-bit)
- aarch64 (ARM 64-bit) - через AppImage

## 🚀 Установка на РЕД ОС

### Установка через DNF (рекомендуется)
```bash
# Скачайте RPM пакет
wget https://github.com/sorydima/REChain-/releases/latest/download/rechainonline-4.1.10-1.x86_64.rpm

# Установите пакет с автоматическим разрешением зависимостей
sudo dnf install rechainonline-4.1.10-1.x86_64.rpm

# Или установите локально
sudo dnf localinstall rechainonline-4.1.10-1.x86_64.rpm
```

### Установка через YUM (для старых версий)
```bash
# Для РЕД ОС 7.x
sudo yum install rechainonline-4.1.10-1.x86_64.rpm

# Или используйте rpm напрямую
sudo rpm -ivh rechainonline-4.1.10-1.x86_64.rpm
```

### Установка через RPM
```bash
# Прямая установка
sudo rpm -i rechainonline-4.1.10-1.x86_64.rpm

# Обновление существующей версии
sudo rpm -U rechainonline-4.1.10-1.x86_64.rpm

# Принудительная установка (если есть конфликты)
sudo rpm -i --force rechainonline-4.1.10-1.x86_64.rpm
```

## 🏢 Корпоративная настройка

### Настройка корпоративного репозитория
```bash
# Создание локального репозитория
sudo mkdir -p /var/www/html/repo/rechainonline
sudo cp rechainonline-4.1.10-1.x86_64.rpm /var/www/html/repo/rechainonline/
sudo createrepo /var/www/html/repo/rechainonline/

# Настройка клиентов
sudo tee /etc/yum.repos.d/rechainonline.repo << EOF
[rechainonline]
name=REChain Corporate Repository
baseurl=http://repo.company.ru/rechainonline/
enabled=1
gpgcheck=0
EOF
```

### Массовое развертывание через Ansible
```yaml
# rechainonline-deploy.yml
---
- name: Deploy REChain on RED OS
  hosts: redos_servers
  become: yes
  vars:
    rechainonline_version: "4.1.10-1"
    
  tasks:
    - name: Add REChain repository
      yum_repository:
        name: rechainonline
        description: REChain Corporate Repository
        baseurl: http://repo.company.ru/rechainonline/
        enabled: yes
        gpgcheck: no
        
    - name: Install REChain
      dnf:
        name: rechainonline
        state: present
        
    - name: Configure corporate settings
      template:
        src: rechainonline-config.j2
        dest: /etc/rechainonline/config.json
        mode: '0644'
        
    - name: Enable REChain service
      systemd:
        name: rechainonline
        enabled: yes
        state: started
```

## 🔧 Интеграция с РЕД ОС

### Интеграция с Active Directory
```bash
# Присоединение к домену
sudo realm join --user=administrator company.local

# Настройка SSO для REChain
sudo tee /etc/rechainonline/sso.conf << EOF
[sso]
enabled=true
domain=company.local
server=https://sso.company.local
client_id=rechainonline
EOF
```

### Настройка с FreeIPA
```bash
# Установка клиента FreeIPA
sudo dnf install freeipa-client

# Присоединение к домену FreeIPA
sudo ipa-client-install --domain=company.local --server=ipa.company.local

# Конфигурация REChain для работы с FreeIPA
sudo tee -a /etc/rechainonline/ldap.conf << EOF
[ldap]
server=ldap://ipa.company.local
base_dn=dc=company,dc=local
bind_dn=uid=rechainonline,cn=sysaccounts,cn=etc,dc=company,dc=local
EOF
```

## 🔐 Безопасность и соответствие

### Настройка SELinux
```bash
# Проверка статуса SELinux
sestatus

# Создание политики SELinux для REChain
sudo setsebool -P httpd_can_network_connect 1
sudo semanage fcontext -a -t bin_t "/usr/bin/rechainonline"
sudo restorecon -v /usr/bin/rechainonline

# Создание пользовательской политики
sudo tee rechainonline.te << EOF
module rechainonline 1.0;

require {
    type unconfined_t;
    type http_port_t;
    class tcp_socket name_connect;
}

allow unconfined_t http_port_t:tcp_socket name_connect;
EOF

# Компиляция и установка политики
checkmodule -M -m -o rechainonline.mod rechainonline.te
semodule_package -o rechainonline.pp -m rechainonline.mod
sudo semodule -i rechainonline.pp
```

### Настройка брандмауэра
```bash
# Настройка firewalld
sudo firewall-cmd --permanent --add-port=443/tcp
sudo firewall-cmd --permanent --add-port=8448/tcp
sudo firewall-cmd --reload

# Создание пользовательского сервиса
sudo tee /etc/firewalld/services/rechainonline.xml << EOF
<?xml version="1.0" encoding="utf-8"?>
<service>
  <short>REChain</short>
  <description>REChain Matrix Client</description>
  <port protocol="tcp" port="443"/>
  <port protocol="tcp" port="8448"/>
</service>
EOF

sudo firewall-cmd --permanent --add-service=rechainonline
sudo firewall-cmd --reload
```

## 📊 Мониторинг и логирование

### Настройка systemd журналирования
```bash
# Создание конфигурации для журналирования
sudo mkdir -p /etc/systemd/system/rechainonline.service.d/
sudo tee /etc/systemd/system/rechainonline.service.d/logging.conf << EOF
[Service]
StandardOutput=journal
StandardError=journal
SyslogIdentifier=rechainonline
EOF

# Просмотр логов
sudo journalctl -u rechainonline -f
```

### Интеграция с rsyslog
```bash
# Настройка rsyslog для REChain
sudo tee /etc/rsyslog.d/rechainonline.conf << EOF
# REChain logging
:programname, isequal, "rechainonline" /var/log/rechainonline.log
& stop
EOF

sudo systemctl restart rsyslog
```

### Мониторинг через Zabbix
```bash
# Установка Zabbix агента
sudo dnf install zabbix-agent2

# Конфигурация мониторинга REChain
sudo tee /etc/zabbix/zabbix_agent2.d/rechainonline.conf << EOF
# REChain monitoring
UserParameter=rechainonline.status,systemctl is-active rechainonline
UserParameter=rechainonline.memory,ps -o rss= -p $(pgrep rechainonline) | awk '{sum+=$1} END {print sum*1024}'
UserParameter=rechainonline.connections,netstat -an | grep :8448 | wc -l
EOF

sudo systemctl restart zabbix-agent2
```

## 🔄 Обновление и обслуживание

### Автоматические обновления
```bash
# Настройка автоматических обновлений
sudo dnf install dnf-automatic

# Конфигурация для REChain
sudo tee -a /etc/dnf/automatic.conf << EOF
[commands]
upgrade_type = security
download_updates = yes
apply_updates = yes

[emitters]
emit_via = email
email_from = admin@company.ru
email_to = it@company.ru
EOF

sudo systemctl enable --now dnf-automatic.timer
```

### Резервное копирование конфигурации
```bash
#!/bin/bash
# backup-rechainonline.sh

BACKUP_DIR="/backup/rechainonline/$(date +%Y%m%d)"
mkdir -p "$BACKUP_DIR"

# Резервное копирование конфигурации
cp -r /etc/rechainonline/ "$BACKUP_DIR/"
cp -r /usr/share/rechainonline/ "$BACKUP_DIR/"

# Резервное копирование пользовательских данных
for user in $(ls /home/); do
    if [ -d "/home/$user/.config/REChain" ]; then
        mkdir -p "$BACKUP_DIR/users/$user"
        cp -r "/home/$user/.config/REChain" "$BACKUP_DIR/users/$user/"
    fi
done

# Создание архива
tar -czf "$BACKUP_DIR.tar.gz" -C "$BACKUP_DIR" .
rm -rf "$BACKUP_DIR"

echo "Backup completed: $BACKUP_DIR.tar.gz"
```

## 🚨 Устранение неполадок

### Проблемы с зависимостями
```bash
# Проверка зависимостей
rpm -qR rechainonline

# Поиск недостающих библиотек
ldd /usr/share/rechainonline/rechainonline

# Установка недостающих зависимостей
sudo dnf install gtk3-devel glib2-devel libsecret-devel
```

### Проблемы с SELinux
```bash
# Проверка нарушений SELinux
sudo ausearch -m avc -ts recent | grep rechainonline

# Временное отключение SELinux для тестирования
sudo setenforce 0

# Создание разрешающей политики
sudo audit2allow -a -M rechainonline_local
sudo semodule -i rechainonline_local.pp
```

### Проблемы с сетью
```bash
# Проверка сетевых подключений
ss -tulpn | grep rechainonline

# Тестирование подключения к Matrix серверу
curl -v https://matrix.org/_matrix/client/versions

# Проверка DNS разрешения
dig matrix.org
nslookup matrix.org
```

## 📋 Чек-лист для администраторов РЕД ОС

### Подготовка к установке
- [ ] Проверена версия РЕД ОС
- [ ] Настроен корпоративный репозиторий
- [ ] Подготовлены сертификаты SSL
- [ ] Настроена интеграция с доменом

### Установка и настройка
- [ ] Установлен RPM пакет
- [ ] Настроена политика SELinux
- [ ] Сконфигурирован брандмауэр
- [ ] Проверена интеграция с AD/FreeIPA

### Мониторинг и обслуживание
- [ ] Настроено журналирование
- [ ] Добавлен мониторинг в Zabbix
- [ ] Настроены автоматические обновления
- [ ] Создан скрипт резервного копирования

## 📞 Поддержка для РЕД ОС

**Корпоративная поддержка:**
- Email: redos-support@rechain.network
- Горячая линия: +7 (495) 987-65-43
- Telegram: @REChainRedOSSupport

**Ресурсы:**
- База знаний РЕД ОС
- Форум технической поддержки
- Документация по интеграции

---

*Руководство для РЕД ОС версии 4.1.20+1162*
*Сертифицировано для корпоративного использования*
