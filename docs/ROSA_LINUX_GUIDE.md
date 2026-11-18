# REChain для ОС РОСА (ROSA Linux)

## 🌹 Специальное руководство для ОС РОСА

ОС РОСА (ROSA Linux) - это российская десктопная операционная система, ориентированная на домашних пользователей и малый бизнес. REChain оптимизирован для удобного использования в ROSA.

## 📋 Поддерживаемые версии ROSA

### Десктопные редакции
- **ROSA Fresh Desktop** R12 и выше
- **ROSA Marathon** 2021.1 и выше
- **ROSA Cobalt** (все версии)
- **ROSA Chrome** (специальная редакция)

### Серверные редакции
- **ROSA Enterprise Linux Server** 7.x и выше
- **ROSA Virtualization** 7.x и выше

## 🚀 Установка на ROSA Linux

### Установка через URPMI (рекомендуется)
```bash
# Обновление системы
sudo urpmi.update -a

# Скачивание RPM пакета
wget https://github.com/sorydima/REChain-/releases/latest/download/rechainonline-4.1.10-1.x86_64.rpm

# Установка через urpmi
sudo urpmi rechainonline-4.1.10-1.x86_64.rpm

# Или установка с автоматическим разрешением зависимостей
sudo urpmi --auto rechainonline-4.1.10-1.x86_64.rpm
```

### Установка через RPM
```bash
# Прямая установка
sudo rpm -i rechainonline-4.1.10-1.x86_64.rpm

# Установка с принудительным разрешением зависимостей
sudo rpm -i --force --nodeps rechainonline-4.1.10-1.x86_64.rpm

# Обновление существующей версии
sudo rpm -U rechainonline-4.1.10-1.x86_64.rpm
```

### Установка через Rpmdrake (графический интерфейс)
```bash
# Запуск графического менеджера пакетов
sudo rpmdrake

# В интерфейсе:
# 1. Файл -> Установить RPM пакет
# 2. Выбрать rechainonline-4.1.10-1.x86_64.rpm
# 3. Нажать "Установить"
```

## 🎨 Интеграция с рабочим столом ROSA

### Настройка для KDE Plasma (ROSA Fresh)
```bash
# Добавление в автозапуск
mkdir -p ~/.config/autostart/
cp /usr/share/applications/rechainonline.desktop ~/.config/autostart/

# Настройка темы для соответствия ROSA
kwriteconfig5 --file ~/.config/rechainonlinerc --group Appearance --key Theme "ROSA"
kwriteconfig5 --file ~/.config/rechainonlinerc --group Appearance --key AccentColor "#E91E63"

# Интеграция с панелью задач
kwriteconfig5 --file ~/.config/rechainonlinerc --group General --key MinimizeToTray true
```

### Настройка для GNOME (ROSA Marathon)
```bash
# Установка расширения для GNOME
mkdir -p ~/.local/share/gnome-shell/extensions/rechainonline@rechain.online/
cp -r /usr/share/rechainonline/gnome-extension/* ~/.local/share/gnome-shell/extensions/rechainonline@rechain.online/

# Активация расширения
gnome-extensions enable rechainonline@rechain.online

# Настройка уведомлений
gsettings set org.gnome.desktop.notifications application-children "['rechainonline']"
```

### Настройка для LXDE (ROSA Cobalt)
```bash
# Добавление в автозапуск LXDE
mkdir -p ~/.config/autostart/
cp /usr/share/applications/rechainonline.desktop ~/.config/autostart/

# Настройка панели LXDE
echo "rechainonline" >> ~/.config/lxpanel/LXDE/panels/panel
```

## 🏠 Настройка для домашнего использования

### Семейная конфигурация
```bash
# Создание семейного профиля
sudo mkdir -p /etc/rechainonline/profiles/
sudo tee /etc/rechainonline/profiles/family.json << EOF
{
  "profile_name": "Семейный",
  "parental_controls": {
    "enabled": true,
    "age_restrictions": {
      "child": 12,
      "teen": 16
    },
    "time_limits": {
      "weekdays": "18:00-21:00",
      "weekends": "10:00-22:00"
    }
  },
  "family_rooms": [
    "#family-chat:home.local",
    "#homework-help:home.local",
    "#family-photos:home.local"
  ]
}
EOF
```

### Настройка домашнего сервера Matrix
```bash
# Установка Synapse для домашнего использования
sudo urpmi python3-pip
sudo pip3 install matrix-synapse

# Создание конфигурации
sudo python3 -m synapse.app.homeserver \
    --server-name home.local \
    --config-path /etc/synapse/homeserver.yaml \
    --generate-config \
    --report-stats=no

# Настройка REChain для работы с домашним сервером
sudo tee /etc/rechainonline/homeserver.conf << EOF
[homeserver]
url=https://home.local:8448
name=Домашний сервер
registration_enabled=true
guest_access=false
EOF
```

## 💼 Настройка для малого бизнеса

### Корпоративная конфигурация
```bash
# Создание бизнес-профиля
sudo tee /etc/rechainonline/business.conf << EOF
[business]
company_name=ООО "Пример"
domain=company.local
working_hours=09:00-18:00
timezone=Europe/Moscow

[features]
file_sharing=true
screen_sharing=true
voice_calls=true
video_calls=true
encryption=mandatory

[integrations]
email_notifications=true
calendar_sync=true
crm_integration=false
EOF
```

### Интеграция с 1С
```bash
# Настройка интеграции с 1С:Предприятие
sudo tee /etc/rechainonline/1c-integration.conf << EOF
[1c]
enabled=true
server=http://1c-server.company.local
database=company_db
username=rechainonline_user
sync_contacts=true
sync_tasks=true
notifications=true
EOF
```

## 🎮 Мультимедиа и развлечения

### Настройка для игр и стриминга
```bash
# Оптимизация для игровых сообществ
sudo tee /etc/rechainonline/gaming.conf << EOF
[gaming]
low_latency_mode=true
game_overlay=true
streaming_integration=true
voice_quality=high

[discord_bridge]
enabled=true
bot_token=your_bot_token
sync_channels=true
EOF
```

### Интеграция с медиацентром
```bash
# Настройка для работы с Kodi
sudo tee /etc/rechainonline/kodi-integration.conf << EOF
[kodi]
enabled=true
host=127.0.0.1
port=8080
share_now_playing=true
remote_control=true
EOF
```

## 🔧 Оптимизация производительности

### Настройка для слабых компьютеров
```bash
# Создание облегченной конфигурации
sudo tee /etc/rechainonline/performance.conf << EOF
[performance]
hardware_acceleration=false
animations=false
background_sync=limited
cache_size=50MB
max_timeline_events=100

[ui]
theme=light
font_size=small
compact_mode=true
EOF
```

### Настройка для мощных систем
```bash
# Максимальная производительность
sudo tee /etc/rechainonline/high-performance.conf << EOF
[performance]
hardware_acceleration=true
gpu_rendering=true
preload_rooms=true
cache_size=500MB
max_timeline_events=1000

[features]
all_enabled=true
experimental_features=true
EOF
```

## 📱 Синхронизация с мобильными устройствами

### Настройка синхронизации
```bash
# Конфигурация для синхронизации с Android/iOS
sudo tee /etc/rechainonline/mobile-sync.conf << EOF
[mobile]
cross_signing=true
backup_keys=true
push_notifications=true
sync_settings=true

[android]
fcm_enabled=true
unified_push=true

[ios]
apns_enabled=true
background_sync=true
EOF
```

## 🔐 Безопасность для домашних пользователей

### Простая настройка безопасности
```bash
# Базовые настройки безопасности
sudo tee /etc/rechainonline/security-simple.conf << EOF
[security]
auto_updates=true
encrypted_storage=true
secure_backup=true
device_verification=required

[privacy]
analytics=false
crash_reports=false
usage_stats=false
EOF
```

## 🚨 Устранение неполадок в ROSA

### Проблемы с URPMI
```bash
# Очистка кэша URPMI
sudo urpmi.removemedia -a
sudo urpmi.addmedia --distrib --mirrorlist http://mirrors.rosalab.ru/rosa/

# Обновление базы данных пакетов
sudo urpmi.update -a

# Переустановка REChain
sudo urpme rechainonline
sudo urpmi rechainonline-4.1.10-1.x86_64.rpm
```

### Проблемы с мультимедиа
```bash
# Установка кодеков
sudo urpmi gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly

# Проверка звука
aplay /usr/share/sounds/alsa/Front_Left.wav

# Проверка видео
gst-launch-1.0 videotestsrc ! autovideosink
```

### Проблемы с темами оформления
```bash
# Сброс настроек темы
rm -rf ~/.config/rechainonline/themes/
mkdir -p ~/.config/rechainonline/themes/

# Применение стандартной темы ROSA
cp -r /usr/share/rechainonline/themes/rosa/ ~/.config/rechainonline/themes/
```

## 📋 Чек-лист для пользователей ROSA

### Первоначальная настройка
- [ ] Установлен пакет REChain
- [ ] Настроена интеграция с рабочим столом
- [ ] Проверена работа мультимедиа
- [ ] Настроены уведомления

### Персонализация
- [ ] Выбрана подходящая тема
- [ ] Настроены горячие клавиши
- [ ] Добавлены нужные комнаты
- [ ] Настроена синхронизация с мобильными устройствами

### Безопасность
- [ ] Включено шифрование
- [ ] Настроена верификация устройств
- [ ] Создана резервная копия ключей
- [ ] Проверены настройки приватности

## 🎯 Специальные возможности ROSA

### Интеграция с ROSA Media Player
```bash
# Настройка совместной работы с медиаплеером
sudo tee /etc/rechainonline/media-player.conf << EOF
[media_player]
integration=true
share_now_playing=true
remote_control=true
playlist_sync=false
EOF
```

### Поддержка ROSA Welcome
```bash
# Добавление REChain в ROSA Welcome
sudo tee /usr/share/rosa-welcome/apps/rechainonline.desktop << EOF
[Desktop Entry]
Name=REChain
Name[ru]=РЕЧейн
Comment=Secure messaging and collaboration
Comment[ru]=Безопасные сообщения и совместная работа
Icon=rechainonline
Exec=rechainonline
Categories=Network;InstantMessaging;
EOF
```

## 📞 Поддержка для ROSA Linux

**Пользовательская поддержка:**
- Email: rosa-support@rechain.network
- Форум: https://forum.rechain.online/rosa
- Telegram: @REChainROSASupport

**Ресурсы:**
- Видеоуроки для начинающих
- FAQ по настройке
- Сообщество пользователей ROSA

---

*Руководство для ROSA Linux версии 4.1.20+1162*
*Оптимизировано для домашнего использования*
