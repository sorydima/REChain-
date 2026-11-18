# REChain - Быстрый справочник для российских ОС Linux

## 🚀 Экспресс-установка

### Автоматическое определение ОС и установка
```bash
curl -fsSL https://raw.githubusercontent.com/sorydima/REChain-/main/scripts/build_russian_linux.sh | bash
```

## 📦 Ручная установка по ОС

| ОС | Команда установки |
|---|---|
| **Astra Linux** | `sudo dpkg -i rechainonline-4.1.10-amd64.deb && sudo apt-get install -f` |
| **РЕД ОС** | `sudo dnf install rechainonline-4.1.10-1.x86_64.rpm` |
| **ОС «Альт»** | `sudo apt-get install ./rechainonline-4.1.10-1.x86_64.rpm` |
| **РОСА** | `sudo urpmi rechainonline-4.1.10-1.x86_64.rpm` |
| **Эльбрус** | `chmod +x rechainonline.AppImage && ./rechainonline.AppImage` |
| **Универсальная** | `chmod +x rechainonline.AppImage && ./rechainonline.AppImage --appimage-integrate` |

## 🔧 Основные команды

### Управление службой
```bash
# Запуск
rechainonline

# Запуск в фоновом режиме
rechainonline --minimized

# Проверка статуса
ps aux | grep rechainonline

# Остановка
pkill rechainonline
```

### Конфигурация
```bash
# Конфигурационные файлы
~/.config/REChain/config.json          # Пользовательские настройки
/etc/rechainonline/config.json         # Системные настройки

# Логи
~/.local/share/REChain/logs/           # Пользовательские логи
journalctl -u rechainonline            # Системные логи
```

### Диагностика
```bash
# Проверка зависимостей
ldd /usr/share/rechainonline/rechainonline

# Проверка сетевых подключений
ss -tulpn | grep rechainonline

# Проверка использования ресурсов
top -p $(pgrep rechainonline)
```

## 🔐 Быстрая настройка безопасности

### ГОСТ алгоритмы
```bash
# Включение ГОСТ шифрования
echo '{"crypto": {"gost_enabled": true}}' > ~/.config/REChain/crypto.json
```

### Корпоративные настройки
```bash
# Настройка прокси
export https_proxy=http://proxy.company.ru:8080
export http_proxy=http://proxy.company.ru:8080
```

## 🚨 Быстрое решение проблем

| Проблема | Решение |
|---|---|
| Не запускается | `chmod +x /usr/bin/rechainonline` |
| Ошибка библиотек | `sudo apt-get install libgtk-3-0` (DEB) / `sudo dnf install gtk3` (RPM) |
| Нет интернета | Проверить `curl https://matrix.org` |
| Прокси проблемы | Настроить `http_proxy` и `https_proxy` |
| Права доступа | `sudo chown -R $USER ~/.config/REChain/` |

## 📞 Контакты поддержки

| ОС | Email | Telegram |
|---|---|---|
| **Astra Linux** | astra-support@rechain.network | @REChainAstraSupport |
| **РЕД ОС** | redos-support@rechain.network | @REChainRedOSSupport |
| **ОС «Альт»** | alt-support@rechain.network | @REChainAltSupport |
| **РОСА** | rosa-support@rechain.network | @REChainROSASupport |
| **Эльбрус** | elbrus-support@rechain.network | @REChainElbrusSupport |
| **Общая** | support@rechain.network | @REChainSupport |

## 🔗 Полезные ссылки

- **[Полная документация](INDEX.md)** - Индекс всех руководств
- **[Устранение неполадок](TROUBLESHOOTING_RUSSIAN_LINUX.md)** - Подробное решение проблем
- **[Безопасность](SECURITY_COMPLIANCE_RUSSIAN.md)** - ФСТЭК и ГОСТ соответствие
- **[GitHub Issues](https://github.com/sorydima/REChain-/issues)** - Сообщить о проблеме
- **[Форум](https://forum.rechain.online)** - Сообщество пользователей

---
*Быстрый справочник REChain v4.1.20+1162*
