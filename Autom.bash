#!/bin/bash

read -p "Введите название проекта: " project_name
read -p "Введите директорию для создания структуры (по умолчанию текущая): " dir
dir=${dir:-.}

mkdir -p "$dir/$project_name/src/scripts"
mkdir -p "$dir/$project_name/src/styles"
mkdir -p "$dir/$project_name/src/images"
touch "$dir/$project_name/README.md"
touch "$dir/$project_name/.gitignore"

echo "node_modules/" >> "$dir/$project_name/.gitignore"
echo "*.log" >> "$dir/$project_name/.gitignore"
echo "dist/" >> "$dir/$project_name/.gitignore"

echo "Структура проекта '$project_name' успешно создана в директории '$dir'!"
