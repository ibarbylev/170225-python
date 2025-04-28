#!/bin/bash

# Получаем имя текущей папки
folder_name=$(basename "$PWD")

# Спрашиваем у пользователя
read -p "Конвертировать все .py файлы в папке \"$folder_name\" в .ipynb файлы? (y/n): " answer

# Приводим ответ к нижнему регистру
answer=$(echo "$answer" | tr '[:upper:]' '[:lower:]')

if [[ "$answer" == "y" ]]; then
    echo "Начинаем конвертацию всех .py файлов в .ipynb..."

    for file in *.py; do
        if [ -f "$file" ]; then
            echo "Конвертирую $file..."
            jupytext --to notebook "$file"
        fi
    done

    echo "✅ Все файлы успешно сконвертированы!"
else
    echo "❌ Конвертация отменена."
fi
