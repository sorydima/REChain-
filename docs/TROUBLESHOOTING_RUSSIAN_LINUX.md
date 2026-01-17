# Устранение неполадок REChain в российских ОС Linux

## 🔧 Общие проблемы и решения

### Проблемы с установкой пакетов

#### DEB пакеты (Astra Linux)
```bash
# Ошибка: "dpkg: dependency problems"
sudo apt-get install -f
sudo dpkg --configure -a

# Ошибка: "Package is not available"
sudo apt-get update
sudo apt-get install rechainonline

# Принудительная установка (осторожно!)
sudo dpkg -i --force-depends rechainonline-4.1.10-amd64.deb
```

#### RPM пакеты (РЕД ОС, ОС «Альт», РОСА)
```bash
# Ошибка: "Failed dependencies"
sudo dnf install rechainonline-4.1.10-1.x86_64.rpm --skip-broken
sudo yum localinstall rechainonline-4.1.10-1.x86_64.rpm --nogpgcheck

# Конфликт пакетов
sudo rpm -e --nodeps conflicting-package
sudo rpm -i rechainonline-4.1.10-1.x86_64.rpm

# Проблемы с подписью
sudo rpm --import https://rechain.online/gpg-key.asc
sudo rpm -i rechainonline-4.1.10-1.x86_64.rpm
```

#### AppImage проблемы
```bash
# Ошибка: "Permission denied"
chmod +x rechainonline.AppImage

# Ошибка: "FUSE not available"
sudo modprobe fuse
sudo apt-get install fuse  # или yum install fuse

# Запуск без FUSE
./rechainonline.AppImage --appimage-extract-and-run
```

### Проблемы с запуском

#### Не запускается графический интерфейс
```bash
# Проверка переменных окружения
echo $DISPLAY
echo $WAYLAND_DISPLAY
echo $XDG_SESSION_TYPE

# Для X11
export DISPLAY=:0
rechainonline

# Для Wayland
export WAYLAND_DISPLAY=wayland-0
rechainonline

# Принудительный запуск с X11
GDK_BACKEND=x11 rechainonline
```

#### Ошибки библиотек
```bash
# Проверка зависимостей
ldd /usr/share/rechainonline/rechainonline

# Установка недостающих библиотек (Debian/Ubuntu-based)
sudo apt-get install libgtk-3-0 libglib2.0-0 libsqlite3-0

# Установка недостающих библиотек (RPM-based)
sudo dnf install gtk3 glib2 sqlite
sudo yum install gtk3-devel glib2-devel sqlite-devel
```

#### Проблемы с правами доступа
```bash
# Проверка прав на исполняемый файл
ls -la /usr/bin/rechainonline

# Восстановление прав
sudo chmod +x /usr/bin/rechainonline
sudo chown root:root /usr/bin/rechainonline

# Проблемы с домашней директорией
mkdir -p ~/.config/REChain/
chmod 755 ~/.config/REChain/
```

### Сетевые проблемы

#### Не подключается к серверу Matrix
```bash
# Проверка подключения к интернету
ping -c 4 8.8.8.8

# Проверка DNS
nslookup matrix.org
dig matrix.org

# Проверка портов
telnet matrix.org 443
telnet matrix.org 8448

# Проверка через curl
curl -v https://matrix.org/_matrix/client/versions
```

#### Проблемы с прокси
```bash
# Настройка прокси для REChain
export http_proxy=http://proxy.company.ru:8080
export https_proxy=http://proxy.company.ru:8080
export no_proxy=localhost,127.0.0.1,*.local

# Проверка настроек прокси
echo $http_proxy
echo $https_proxy

# Тест подключения через прокси
curl --proxy http://proxy.company.ru:8080 https://matrix.org
```

#### Проблемы с брандмауэром
```bash
# Проверка статуса брандмауэра
sudo ufw status  # Ubuntu/Debian
sudo firewall-cmd --state  # CentOS/RHEL/Fedora

# Разрешение портов для Matrix
sudo ufw allow out 443/tcp
sudo ufw allow out 8448/tcp

# Для firewalld
sudo firewall-cmd --permanent --add-port=443/tcp
sudo firewall-cmd --permanent --add-port=8448/tcp
sudo firewall-cmd --reload
```

### Проблемы с производительностью

#### Медленная работа приложения
```bash
# Проверка использования ресурсов
top -p $(pgrep rechainonline)
htop -p $(pgrep rechainonline)

# Проверка использования памяти
ps aux | grep rechainonline
cat /proc/$(pgrep rechainonline)/status

# Очистка кэша
rm -rf ~/.cache/REChain/
rm -rf ~/.local/share/REChain/cache/
```

#### Проблемы с видео/аудио
```bash
# Проверка аудиосистемы
aplay -l
pactl info

# Проверка видеосистемы
lspci | grep -i vga
glxinfo | grep "direct rendering"

# Установка кодеков
sudo apt-get install gstreamer1.0-plugins-good gstreamer1.0-plugins-bad
sudo dnf install gstreamer1-plugins-good gstreamer1-plugins-bad-free
```

## 🔐 Проблемы безопасности

### Проблемы с шифрованием
```bash
# Проверка поддержки криптографии
openssl version
gpg --version

# Проверка ключей шифрования
ls -la ~/.config/REChain/crypto/
chmod 600 ~/.config/REChain/crypto/*

# Сброс ключей шифрования (ВНИМАНИЕ: потеря данных!)
rm -rf ~/.config/REChain/crypto/
# Потребуется повторная верификация устройств
```

### Проблемы с сертификатами
```bash
# Проверка сертификатов
openssl s_client -connect matrix.org:443 -servername matrix.org

# Обновление корневых сертификатов
sudo apt-get update && sudo apt-get install ca-certificates
sudo dnf update ca-certificates

# Добавление корпоративного сертификата
sudo cp company-ca.crt /usr/local/share/ca-certificates/
sudo update-ca-certificates
```

## 🏢 Корпоративные проблемы

### Проблемы с доменной аутентификацией
```bash
# Проверка подключения к домену
realm list
kinit username@DOMAIN.LOCAL

# Проверка Kerberos
klist
kdestroy && kinit username@DOMAIN.LOCAL

# Проверка LDAP
ldapsearch -x -H ldap://dc.domain.local -b "dc=domain,dc=local"
```

### Проблемы с групповыми политиками
```bash
# Проверка применения политик
gpupdate /force  # Windows-style
# Или для Linux
sudo /usr/sbin/update-policy

# Проверка конфигурации
cat /etc/rechainonline/policy.conf
ls -la /etc/rechainonline/policies/
```

## 📱 Проблемы синхронизации

### Не синхронизируются сообщения
```bash
# Проверка статуса синхронизации
journalctl -u rechainonline --since "1 hour ago"

# Принудительная синхронизация
rechainonline --sync-force

# Очистка базы данных синхронизации
rm -rf ~/.local/share/REChain/sync.db
# Потребуется повторная синхронизация
```

### Проблемы с уведомлениями
```bash
# Проверка службы уведомлений
systemctl --user status rechainonline-notifications

# Проверка настроек уведомлений
gsettings list-recursively org.gnome.desktop.notifications
dconf dump /org/gnome/desktop/notifications/

# Сброс настроек уведомлений
gsettings reset-recursively org.gnome.desktop.notifications
```

## 🖥️ Проблемы с рабочим столом

### Проблемы интеграции с KDE
```bash
# Проверка интеграции с KDE
kreadconfig5 --file ~/.config/rechainonlinerc
qdbus org.kde.rechainonline

# Сброс настроек KDE
rm -rf ~/.config/rechainonlinerc
rm -rf ~/.local/share/kxmlgui5/rechainonline/
```

### Проблемы интеграции с GNOME
```bash
# Проверка расширений GNOME
gnome-extensions list | grep rechainonline
gnome-extensions info rechainonline@rechain.online

# Переустановка расширения
gnome-extensions uninstall rechainonline@rechain.online
gnome-extensions install rechainonline@rechain.online
```

## 🔍 Диагностика и логирование

### Включение отладочного режима
```bash
# Запуск с подробным логированием
rechainonline --verbose --debug

# Сохранение логов в файл
rechainonline --verbose 2>&1 | tee ~/rechainonline-debug.log

# Просмотр системных логов
journalctl -u rechainonline -f
tail -f ~/.local/share/REChain/logs/rechainonline.log
```

### Сбор диагностической информации
```bash
#!/bin/bash
# collect-diagnostics.sh

DIAG_DIR="rechainonline-diagnostics-$(date +%Y%m%d-%H%M%S)"
mkdir -p "$DIAG_DIR"

# Системная информация
uname -a > "$DIAG_DIR/system-info.txt"
lsb_release -a >> "$DIAG_DIR/system-info.txt" 2>/dev/null
cat /etc/os-release >> "$DIAG_DIR/system-info.txt"

# Информация о пакете
dpkg -l | grep rechainonline > "$DIAG_DIR/package-info.txt" 2>/dev/null
rpm -qa | grep rechainonline >> "$DIAG_DIR/package-info.txt" 2>/dev/null

# Конфигурационные файлы
cp -r ~/.config/REChain/ "$DIAG_DIR/user-config/" 2>/dev/null
cp -r /etc/rechainonline/ "$DIAG_DIR/system-config/" 2>/dev/null

# Логи
cp ~/.local/share/REChain/logs/* "$DIAG_DIR/logs/" 2>/dev/null
journalctl -u rechainonline --since "24 hours ago" > "$DIAG_DIR/systemd-logs.txt"

# Сетевая информация
ss -tulpn | grep rechainonline > "$DIAG_DIR/network-info.txt"
ip route show >> "$DIAG_DIR/network-info.txt"

# Создание архива
tar -czf "$DIAG_DIR.tar.gz" "$DIAG_DIR"
rm -rf "$DIAG_DIR"

echo "Диагностическая информация собрана в: $DIAG_DIR.tar.gz"
```

## 📞 Получение поддержки

### Подготовка к обращению в поддержку
1. Соберите диагностическую информацию (скрипт выше)
2. Опишите проблему максимально подробно
3. Укажите версию ОС и REChain
4. Приложите скриншоты ошибок
5. Укажите шаги для воспроизведения проблемы

### Контакты технической поддержки
- **Общая поддержка:** support@rechain.network
- **Astra Linux:** astra-support@rechain.network
- **РЕД ОС:** redos-support@rechain.network
- **ОС «Альт»:** alt-support@rechain.network
- **РОСА:** rosa-support@rechain.network
- **Эльбрус:** elbrus-support@rechain.network

### Сообщество и форумы
- **Telegram:** @REChainSupport
- **Matrix:** #support:rechain.online
- **GitHub Issues:** https://github.com/sorydima/REChain-/issues
- **Форум:** https://forum.rechain.online

## 🛠️ Инструменты диагностики

### Автоматическая диагностика
```bash
# Скрипт автоматической диагностики
curl -s https://rechain.online/scripts/diagnose.sh | bash

# Или скачать и запустить локально
wget https://rechain.online/scripts/diagnose.sh
chmod +x diagnose.sh
./diagnose.sh
```

### Проверка целостности установки
```bash
# Для DEB пакетов
sudo dpkg --verify rechainonline

# Для RPM пакетов
sudo rpm --verify rechainonline

# Проверка контрольных сумм
sha256sum /usr/bin/rechainonline
md5sum /usr/share/rechainonline/rechainonline
```

---

*Руководство по устранению неполадок версии 4.1.10+1160*
*Обновлено для всех поддерживаемых российских ОС Linux*
