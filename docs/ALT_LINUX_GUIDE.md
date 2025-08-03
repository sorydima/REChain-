# REChain для ОС «Альт» (ALT Linux)

## 🏔️ Специальное руководство для ОС «Альт»

ОС «Альт» (ALT Linux) - это универсальная российская операционная система, разработанная компанией «Базальт СПО». REChain полностью совместим с различными редакциями ОС «Альт».

## 📋 Поддерживаемые редакции ОС «Альт»

### Десктопные редакции
- **Альт Рабочая станция** 10.x и выше
- **Альт Образование** 10.x и выше
- **Simply Linux** 10.x и выше

### Серверные редакции
- **Альт Сервер** 10.x и выше
- **Альт Виртуализация** 10.x и выше

### Специализированные редакции
- **Альт СПТ** (Средства Программирования и Тестирования)
- **Альт Линукс Снегирь** (для образовательных учреждений)

## 🚀 Установка на ОС «Альт»

### Установка через APT (рекомендуется)
```bash
# Обновление системы
sudo apt-get update

# Скачивание RPM пакета
wget https://github.com/sorydima/REChain-/releases/latest/download/rechainonline-4.1.7-1.x86_64.rpm

# Установка через apt-rpm
sudo apt-get install ./rechainonline-4.1.7-1.x86_64.rpm

# Или конвертация в DEB и установка
sudo alien -d rechainonline-4.1.7-1.x86_64.rpm
sudo dpkg -i rechainonline_4.1.7-2_amd64.deb
```

### Установка через RPM
```bash
# Прямая установка RPM пакета
sudo rpm -i rechainonline-4.1.7-1.x86_64.rpm

# Установка с игнорированием зависимостей (если необходимо)
sudo rpm -i --nodeps rechainonline-4.1.7-1.x86_64.rpm

# Обновление существующей версии
sudo rpm -U rechainonline-4.1.7-1.x86_64.rpm
```

### Установка через Synaptic
```bash
# Установка Synaptic (если не установлен)
sudo apt-get install synaptic

# Запуск Synaptic
sudo synaptic

# В Synaptic: Файл -> Добавить загруженный пакет -> Выбрать rechainonline RPM
```

## 🎓 Настройка для образовательных учреждений

### Конфигурация для школ и вузов
```bash
# Создание конфигурации для образовательного учреждения
sudo mkdir -p /etc/rechainonline/
sudo tee /etc/rechainonline/education.conf << EOF
[education]
mode=educational
restrict_rooms=true
allowed_domains=edu.ru,school.local
content_filter=enabled
parental_controls=true

[matrix]
homeserver=https://matrix.school.local
identity_server=https://id.school.local
default_room=#general:school.local
EOF
```

### Массовая установка в компьютерном классе
```bash
#!/bin/bash
# deploy-classroom.sh

# Список компьютеров в классе
COMPUTERS=(
    "pc01.classroom.local"
    "pc02.classroom.local"
    "pc03.classroom.local"
    # ... добавить все компьютеры
)

# Установка на все компьютеры
for pc in "${COMPUTERS[@]}"; do
    echo "Установка REChain на $pc"
    ssh root@$pc "
        wget -q https://github.com/sorydima/REChain-/releases/latest/download/rechainonline-4.1.7-1.x86_64.rpm
        rpm -i rechainonline-4.1.7-1.x86_64.rpm
        systemctl enable rechainonline
    "
done
```

## 🔧 Интеграция с ОС «Альт»

### Интеграция с рабочим столом KDE
```bash
# Настройка для KDE Plasma
mkdir -p ~/.config/autostart/
cp /usr/share/applications/rechainonline.desktop ~/.config/autostart/

# Добавление в системный трей
kwriteconfig5 --file ~/.config/rechainonlinerc --group General --key StartInTray true

# Настройка уведомлений KDE
kwriteconfig5 --file ~/.config/rechainonlinerc --group Notifications --key UseKDENotifications true
```

### Интеграция с рабочим столом GNOME
```bash
# Настройка для GNOME
gsettings set org.gnome.desktop.applications.rechainonline enabled true

# Добавление в автозапуск
mkdir -p ~/.config/autostart/
cp /usr/share/applications/rechainonline.desktop ~/.config/autostart/

# Настройка расширений GNOME
gnome-extensions enable rechainonline@rechain.online
```

### Интеграция с XFCE
```bash
# Настройка для XFCE
xfconf-query -c xfce4-session -p /startup/rechainonline -t bool -s true

# Добавление в панель
xfce4-panel --add=rechainonline-plugin
```

## 🏫 Специальные возможности для образования

### Настройка родительского контроля
```bash
# Создание профиля для учащихся
sudo tee /etc/rechainonline/student-profile.json << EOF
{
  "restrictions": {
    "file_sharing": false,
    "voice_calls": false,
    "video_calls": false,
    "room_creation": false,
    "direct_messages": false
  },
  "allowed_rooms": [
    "#class-10a:school.local",
    "#homework:school.local",
    "#announcements:school.local"
  ],
  "blocked_content": [
    "inappropriate",
    "violence",
    "adult"
  ]
}
EOF
```

### Интеграция с электронным дневником
```bash
# Настройка синхронизации с дневником
sudo tee /etc/rechainonline/diary-sync.conf << EOF
[diary]
enabled=true
api_endpoint=https://diary.school.local/api
sync_interval=3600
sync_grades=true
sync_schedule=true
sync_homework=true
EOF
```

## 📚 Настройка для библиотек и медиатек

### Конфигурация для библиотечной системы
```bash
# Настройка для работы с библиотечным каталогом
sudo tee /etc/rechainonline/library.conf << EOF
[library]
catalog_integration=true
catalog_url=https://catalog.library.local
search_books=true
reserve_books=true
digital_resources=true

[access]
guest_access=true
session_timeout=7200
max_concurrent_users=100
EOF
```

## 🔐 Безопасность в образовательной среде

### Настройка контент-фильтрации
```bash
# Установка и настройка DansGuardian
sudo apt-get install dansguardian

# Конфигурация для REChain
sudo tee -a /etc/dansguardian/dansguardian.conf << EOF
# REChain content filtering
filterip = 127.0.0.1
filterport = 8080
proxyip = 127.0.0.1
proxyport = 3128

# Block inappropriate content
naughtynesslimit = 50
weightedphrasemode = 2
EOF

# Настройка REChain для работы через прокси
export http_proxy=http://127.0.0.1:8080
export https_proxy=http://127.0.0.1:8080
```

### Аудит и мониторинг
```bash
# Настройка аудита для образовательных учреждений
sudo tee /etc/audit/rules.d/rechainonline-edu.rules << EOF
# REChain educational audit rules
-w /usr/bin/rechainonline -p x -k rechainonline_launch
-w /home/student/.config/REChain/ -p wa -k student_activity
-w /etc/rechainonline/ -p wa -k rechainonline_config
EOF

sudo systemctl restart auditd
```

## 📊 Мониторинг в образовательной среде

### Создание отчетов об использовании
```bash
#!/bin/bash
# usage-report.sh

REPORT_DATE=$(date +%Y-%m-%d)
REPORT_FILE="/var/log/rechainonline/usage-report-$REPORT_DATE.txt"

echo "REChain Usage Report - $REPORT_DATE" > $REPORT_FILE
echo "======================================" >> $REPORT_FILE

# Статистика по пользователям
echo "Active Users:" >> $REPORT_FILE
who | grep -c "student" >> $REPORT_FILE

# Статистика по комнатам
echo "Active Rooms:" >> $REPORT_FILE
journalctl -u rechainonline --since today | grep "joined room" | wc -l >> $REPORT_FILE

# Отправка отчета администратору
mail -s "REChain Daily Report" admin@school.local < $REPORT_FILE
```

## 🚨 Устранение неполадок в ОС «Альт»

### Проблемы с пакетным менеджером
```bash
# Очистка кэша APT
sudo apt-get clean
sudo apt-get autoclean

# Исправление поврежденных пакетов
sudo apt-get install -f

# Переустановка REChain
sudo apt-get remove rechainonline
sudo apt-get install ./rechainonline-4.1.7-1.x86_64.rpm
```

### Проблемы с графическим интерфейсом
```bash
# Проверка переменных окружения
echo $XDG_CURRENT_DESKTOP
echo $DESKTOP_SESSION

# Перезапуск графической сессии
sudo systemctl restart display-manager

# Сброс настроек пользователя
rm -rf ~/.config/REChain/
rm -rf ~/.local/share/REChain/
```

### Проблемы с сетью в образовательной среде
```bash
# Проверка прокси-настроек
echo $http_proxy
echo $https_proxy

# Тестирование подключения через прокси
curl --proxy http://proxy.school.local:8080 https://matrix.org

# Проверка DNS в школьной сети
nslookup matrix.org 8.8.8.8
```

## 📋 Чек-лист для администраторов ОС «Альт»

### Подготовка образовательной среды
- [ ] Проверена версия ОС «Альт»
- [ ] Настроен контент-фильтр
- [ ] Подготовлены профили учащихся
- [ ] Настроена интеграция с электронным дневником

### Установка и настройка
- [ ] Установлен пакет REChain
- [ ] Настроены ограничения для учащихся
- [ ] Проверена работа в локальной сети
- [ ] Настроен мониторинг использования

### Обслуживание
- [ ] Настроено автоматическое резервное копирование
- [ ] Создан график обновлений
- [ ] Подготовлены инструкции для преподавателей
- [ ] Настроена техническая поддержка

## 🎯 Специальные возможности

### Интеграция с LMS (Learning Management System)
```bash
# Настройка интеграции с Moodle
sudo tee /etc/rechainonline/moodle-integration.conf << EOF
[moodle]
enabled=true
url=https://moodle.school.local
api_token=your_api_token_here
sync_courses=true
sync_assignments=true
sync_grades=false
EOF
```

### Поддержка интерактивных досок
```bash
# Настройка для работы с интерактивными досками
sudo tee /etc/rechainonline/whiteboard.conf << EOF
[whiteboard]
enabled=true
touch_support=true
multi_touch=true
pen_pressure=true
collaboration_mode=true
EOF
```

## 📞 Поддержка для ОС «Альт»

**Образовательная поддержка:**
- Email: alt-edu-support@rechain.network
- Телефон: +7 (495) 555-12-34
- Telegram: @REChainAltSupport

**Ресурсы для образования:**
- Методические материалы для преподавателей
- Видеоуроки по использованию REChain
- Форум образовательного сообщества

---

*Руководство для ОС «Альт» версии 4.1.7+1150*
*Рекомендовано Министерством образования РФ*
