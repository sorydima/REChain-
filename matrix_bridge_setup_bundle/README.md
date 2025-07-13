
# Matrix Bridges Final Installer

Этот архив содержит:
- Установочный скрипт
- Конфиги мостов (configs/)
- Registration-файлы для Synapse (registrations/)

## Использование

1. Распакуйте архив:
```bash
unzip matrix_bridges_final_package.zip
cd matrix_bridges_final_package
```

2. Установите мосты вручную или используйте свой install_bridges.sh

3. Registration-файлы подключаются к Synapse:
```bash
cp registrations/*.yaml /opt/matrix/synapse/registration/
```

