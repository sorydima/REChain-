# REChain для российских операционных систем Linux

## 🇷🇺 Поддерживаемые российские ОС

REChain полностью поддерживает все основные российские операционные системы Linux:

### Государственные и корпоративные ОС
- **Astra Linux** - Основная ОС для государственных учреждений
- **РЕД ОС** (RED OS) - Корпоративная российская ОС
- **ОС «Альт»** (ALT Linux) - Универсальная российская ОС
- **ОС РОСА** (ROSA) - Десктопная российская ОС

### Специализированные ОС
- **«ОСнова»** (OSNova) - Альтернативная российская ОС
- **AlterOS** - Модифицированная российская ОС
- **ОС «Атлант»** (Atlant OS) - Специализированная ОС
- **ОС «Стрелец»** (Strelets OS) - Защищенная ОС
- **ОС «МСВСфера 9»** (MSVSphere 9) - Серверная ОС
- **ОС «Лотос»** (Lotos OS) - Легковесная ОС
- **ОС «Аврора»** (Aurora OS) - Мобильная ОС (PWA версия)
- **ОС «Эльбрус»** (Elbrus OS) - ОС для процессоров Эльбрус

## 📦 Доступные форматы пакетов

### 1. DEB пакеты (для Debian-based систем)
**Файл:** `packages/rechainonline-4.1.10-amd64.deb`
**Размер:** 48.4 МБ
**Подходит для:**
- Astra Linux
- Другие системы на базе Debian

### 2. RPM пакеты (для RPM-based систем)
**Бинарный пакет:** `packages/rpm/RPMS/x86_64/rechainonline-4.1.10-1.x86_64.rpm`
**Размер:** 50.3 МБ
**Исходный пакет:** `packages/rpm/SRPMS/rechainonline-4.1.10-1.src.rpm`
**Размер:** 56.7 МБ
**Подходит для:**
- РЕД ОС, ОС «Альт», ОС РОСА, AlterOS, ОС «Атлант», ОС «Стрелец», ОС «МСВСфера 9», ОС «Лотос», ОС «Эльбрус»

### 3. AppImage (универсальный формат)
**Директория:** `packages/appimage/rechainonline.AppDir/`
**Подходит для:** Всех российских Linux систем

## 🚀 Инструкции по установке

### Astra Linux

```bash
# Скачайте DEB пакет
wget https://github.com/sorydima/REChain-/releases/latest/download/rechainonline-4.1.10-amd64.deb

# Установите пакет
sudo dpkg -i rechainonline-4.1.10-amd64.deb

# Исправьте зависимости при необходимости
sudo apt-get install -f

# Запустите приложение
rechainonline
```

### РЕД ОС (RED OS)

```bash
# Скачайте RPM пакет
wget https://github.com/sorydima/REChain-/releases/latest/download/rechainonline-4.1.10-1.x86_64.rpm

# Установите пакет
sudo dnf install rechainonline-4.1.10-1.x86_64.rpm

# Или используйте rpm напрямую
sudo rpm -i rechainonline-4.1.10-1.x86_64.rpm

# Запустите приложение
rechainonline
```

### ОС «Альт» (ALT Linux)

```bash
# Обновите систему
sudo apt-get update

# Скачайте RPM пакет
wget https://github.com/sorydima/REChain-/releases/latest/download/rechainonline-4.1.10-1.x86_64.rpm

# Установите пакет
sudo rpm -i rechainonline-4.1.10-1.x86_64.rpm

# Или используйте apt-rpm
sudo apt-get install ./rechainonline-4.1.10-1.x86_64.rpm

# Запустите приложение
rechainonline
```

### ОС РОСА (ROSA)

```bash
# Скачайте RPM пакет
wget https://github.com/sorydima/REChain-/releases/latest/download/rechainonline-4.1.10-1.x86_64.rpm

# Установите пакет через urpmi
sudo urpmi rechainonline-4.1.10-1.x86_64.rpm

# Или используйте rpm
sudo rpm -i rechainonline-4.1.10-1.x86_64.rpm

# Запустите приложение
rechainonline
```

### ОС «Эльбрус» (Elbrus OS)

```bash
# Для архитектуры e2k используйте AppImage
wget https://github.com/sorydima/REChain-/releases/latest/download/rechainonline.AppImage

# Сделайте файл исполняемым
chmod +x rechainonline.AppImage

# Запустите приложение
./rechainonline.AppImage
```

### Универсальная установка (AppImage)

```bash
# Скачайте AppImage
wget https://github.com/sorydima/REChain-/releases/latest/download/rechainonline.AppImage

# Сделайте файл исполняемым
chmod +x rechainonline.AppImage

# Запустите приложение
./rechainonline.AppImage

# Для интеграции в систему
mkdir -p ~/.local/share/applications
cp rechainonline.AppImage ~/.local/bin/
```

## 🔧 Системные требования

### Минимальные требования
- **ОЗУ:** 2 ГБ
- **Свободное место:** 200 МБ
- **Архитектура:** x86_64 (amd64)
- **Графическая система:** X11 или Wayland

### Рекомендуемые требования
- **ОЗУ:** 4 ГБ или больше
- **Свободное место:** 500 МБ
- **Процессор:** Двухядерный 2 ГГц или быстрее

### Зависимости
Автоматически устанавливаются с пакетом:
- `libc6` / `glibc`
- `libgtk-3-0` / `gtk3`
- `libglib2.0-0` / `glib2`
- Другие системные библиотеки

## 🌐 Локализация

REChain полностью локализован для российских пользователей:
- **Интерфейс:** Полный перевод на русский язык
- **Документация:** Русскоязычная документация
- **Поддержка:** Техническая поддержка на русском языке
- **Локаль:** Поддержка ru_RU.UTF-8

## 🔐 Безопасность и соответствие

### Соответствие российским стандартам
- Совместимость с ГОСТ Р 34.10-2012
- Поддержка российских криптографических алгоритмов
- Соответствие требованиям безопасности государственных систем

### Сертификация
- Тестирование на совместимость с Astra Linux
- Проверка на соответствие требованиям ФСТЭК
- Валидация для использования в государственных учреждениях

## 🆘 Поддержка и устранение неполадок

### Часто встречающиеся проблемы

#### Проблема: Не запускается на Astra Linux
```bash
# Проверьте зависимости
sudo apt-get install -f

# Проверьте права доступа
ls -la /usr/bin/rechainonline

# Переустановите пакет
sudo dpkg --purge rechainonline
sudo dpkg -i rechainonline-4.1.10-amd64.deb
```

#### Проблема: Ошибка зависимостей на РЕД ОС
```bash
# Обновите систему
sudo dnf update

# Установите недостающие зависимости
sudo dnf install gtk3-devel glib2-devel

# Переустановите пакет
sudo dnf reinstall rechainonline-4.1.10-1.x86_64.rpm
```

#### Проблема: AppImage не запускается
```bash
# Проверьте права доступа
chmod +x rechainonline.AppImage

# Проверьте FUSE
sudo modprobe fuse

# Запустите с отладкой
./rechainonline.AppImage --appimage-extract-and-run
```

### Логи и диагностика
```bash
# Просмотр логов приложения
journalctl -f | grep rechainonline

# Запуск с отладочной информацией
rechainonline --verbose

# Проверка системных зависимостей
ldd /usr/share/rechainonline/rechainonline
```

## 📞 Контакты и поддержка

- **Email:** support@rechain.network
- **Telegram:** @REChainSupport
- **GitHub Issues:** https://github.com/sorydima/REChain-/issues
- **Документация:** https://rechain.online/docs
- **Сообщество:** https://matrix.to/#/#rechain:rechain.online

## 📄 Лицензия

REChain распространяется под собственной лицензией. Подробности в файле `REChain_EULA.txt`.

---

*Документация обновлена для версии 4.1.20+1162*
*Дата обновления: Октябрь 2026*
