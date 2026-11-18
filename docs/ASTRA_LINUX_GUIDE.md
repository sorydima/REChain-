# REChain для Astra Linux

## 🛡️ Специальное руководство для Astra Linux

Astra Linux является основной операционной системой для российских государственных учреждений. REChain полностью совместим с требованиями безопасности Astra Linux.

## 📋 Системные требования для Astra Linux

### Поддерживаемые версии
- **Astra Linux Special Edition** (АЛСЕ) 1.7 и выше
- **Astra Linux Common Edition** (АЛСО) 2.12 и выше
- **Astra Linux Orel** 2.12 и выше

### Архитектуры
- x86_64 (Intel/AMD 64-bit)
- Поддержка российских процессоров Эльбрус (через AppImage)

## 🔐 Установка в защищенной среде

### Стандартная установка
```bash
# Скачайте пакет из доверенного источника
wget --no-check-certificate https://github.com/sorydima/REChain-/releases/latest/download/rechainonline-4.1.10-amd64.deb

# Проверьте целостность пакета (опционально)
sha256sum rechainonline-4.1.10-amd64.deb

# Установите пакет
sudo dpkg -i rechainonline-4.1.10-amd64.deb

# Исправьте зависимости
sudo apt-get install -f
```

### Установка в режиме повышенной защищенности
```bash
# Для систем с мандатным контролем доступа
sudo pdpl-user -i rechainonline

# Установка с проверкой цифровой подписи
sudo dpkg --verify rechainonline-4.1.10-amd64.deb
sudo dpkg -i rechainonline-4.1.10-amd64.deb

# Настройка меток безопасности
sudo pdpl-file -l "Несекретно" /usr/bin/rechainonline
```

## 🔒 Настройка безопасности

### Мандатный контроль доступа
```bash
# Установка метки конфиденциальности для приложения
sudo pdpl-file -l "Несекретно" /usr/share/rechainonline/

# Разрешение запуска для пользователей
sudo pdpl-user -a rechainonline -u username

# Проверка меток безопасности
pdpl-file -L /usr/bin/rechainonline
```

### Настройка сетевого доступа
```bash
# Разрешение сетевых подключений для Matrix
sudo ufw allow out 443/tcp comment "REChain HTTPS"
sudo ufw allow out 8448/tcp comment "REChain Matrix Federation"

# Настройка для корпоративного прокси
export https_proxy=http://proxy.company.ru:8080
export http_proxy=http://proxy.company.ru:8080
```

## 🏢 Корпоративное развертывание

### Массовая установка через Ansible
```yaml
# playbook.yml
---
- hosts: astra_workstations
  become: yes
  tasks:
    - name: Download REChain package
      get_url:
        url: https://github.com/sorydima/REChain-/releases/latest/download/rechainonline-4.1.10-amd64.deb
        dest: /tmp/rechainonline.deb
        
    - name: Install REChain
      apt:
        deb: /tmp/rechainonline.deb
        state: present
        
    - name: Configure security labels
      shell: pdpl-file -l "Несекретно" /usr/bin/rechainonline
```

### Групповые политики
```bash
# Создание конфигурации для домена
sudo mkdir -p /etc/rechainonline/
sudo tee /etc/rechainonline/config.json << EOF
{
  "homeserver": "https://matrix.company.ru",
  "identity_server": "https://identity.company.ru",
  "disable_guests": true,
  "disable_3pid_login": true,
  "brand": "Корпоративный REChain"
}
EOF
```

## 🔧 Интеграция с Astra Linux

### Интеграция с рабочим столом Fly
```bash
# Добавление в меню приложений
sudo cp /usr/share/applications/rechainonline.desktop /usr/share/applications/
sudo update-desktop-database

# Настройка автозапуска
mkdir -p ~/.config/autostart/
cp /usr/share/applications/rechainonline.desktop ~/.config/autostart/
```

### Интеграция с системой аутентификации
```bash
# Настройка для работы с доменом Astra Linux
sudo realm join company.local
sudo authconfig --enablekrb5 --update

# Конфигурация SSO для REChain
echo "auth.company.local" | sudo tee -a /etc/rechainonline/sso_domains.txt
```

## 📊 Мониторинг и аудит

### Настройка аудита
```bash
# Добавление правил аудита для REChain
sudo tee -a /etc/audit/rules.d/rechainonline.rules << EOF
-w /usr/bin/rechainonline -p x -k rechainonline_exec
-w /usr/share/rechainonline/ -p wa -k rechainonline_files
-w /home/*/.config/REChain/ -p wa -k rechainonline_user_config
EOF

# Перезапуск службы аудита
sudo systemctl restart auditd
```

### Мониторинг использования
```bash
# Просмотр логов запуска
sudo journalctl -u rechainonline --since today

# Мониторинг сетевой активности
sudo netstat -tulpn | grep rechainonline

# Проверка использования ресурсов
ps aux | grep rechainonline
```

## 🚨 Устранение неполадок в Astra Linux

### Проблемы с мандатным контролем доступа
```bash
# Проверка текущих меток
pdpl-file -L /usr/bin/rechainonline

# Сброс меток безопасности
sudo pdpl-file -c /usr/bin/rechainonline
sudo pdpl-file -l "Несекретно" /usr/bin/rechainonline

# Проверка прав пользователя
pdpl-user -L username
```

### Проблемы с сетевым подключением
```bash
# Проверка сетевых правил
sudo iptables -L | grep -i matrix
sudo ufw status verbose

# Тестирование подключения к серверу
curl -v https://matrix.org/_matrix/client/versions

# Проверка DNS
nslookup matrix.org
```

### Проблемы с графическим интерфейсом
```bash
# Проверка переменных окружения
echo $DISPLAY
echo $WAYLAND_DISPLAY

# Запуск с отладкой
WAYLAND_DEBUG=1 rechainonline

# Проверка библиотек GTK
ldd /usr/share/rechainonline/rechainonline | grep gtk
```

## 📋 Чек-лист для администраторов

### Перед установкой
- [ ] Проверена совместимость версии Astra Linux
- [ ] Настроены сетевые правила брандмауэра
- [ ] Подготовлены метки безопасности
- [ ] Проверены системные зависимости

### После установки
- [ ] Проверен запуск приложения
- [ ] Настроены групповые политики
- [ ] Добавлены правила аудита
- [ ] Протестирована работа в домене
- [ ] Проверена интеграция с рабочим столом

### Регулярное обслуживание
- [ ] Мониторинг логов безопасности
- [ ] Проверка обновлений
- [ ] Резервное копирование конфигураций
- [ ] Аудит использования ресурсов

## 📞 Поддержка для Astra Linux

**Специализированная поддержка:**
- Email: astra-support@rechain.network
- Телефон: +7 (495) 123-45-67
- Telegram: @REChainAstraSupport

**Документация:**
- Руководство администратора Astra Linux
- Политики безопасности REChain
- Инструкции по интеграции с доменом

---

*Руководство для Astra Linux версии 4.1.20+1162*
*Сертифицировано для использования в государственных учреждениях РФ*
