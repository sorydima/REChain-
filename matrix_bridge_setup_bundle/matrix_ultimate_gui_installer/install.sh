
#!/bin/bash
if ! command -v zenity &> /dev/null; then
  echo "Zenity not found, installing..."
  sudo apt-get install -y zenity
fi

zenity --info --text="Добро пожаловать в Matrix Ultimate Installer!"

DEST=$(zenity --entry --title="Установка" --text="Введите путь установки (например /opt/matrix):")
if [ -z "$DEST" ]; then
  zenity --error --text="Путь не указан!"
  exit 1
fi

mkdir -p "$DEST"
cp -r ./matrix_bundle/* "$DEST"

zenity --info --text="Файлы скопированы. Запуск docker-compose..."

docker-compose -f "$DEST/docker-compose.yml" up -d

zenity --info --text="Установка завершена! Matrix Ultimate готов к работе."
