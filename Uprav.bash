#!/bin/bash

groups=("Группа1" "Группа2" "Группа3" "Группа4" "Группа5" 
        "Группа6" "Группа7" "Группа8" "Группа9" "Группа10")

for group in "${groups[@]}"; do
    mkdir "$group"
    
    mkdir "$group/Управление задачами"
    
    mkdir "$group/Документация"
    touch "$group/Документация/Инструкция.txt"
    mkdir "$group/Документация/Шаблоны задач"
    touch "$group/Документация/Шаблоны задач/Шаблон1.txt"
    touch "$group/Документация/Шаблоны задач/Шаблон2.txt"
    
    mkdir "$group/Код"
    mkdir "$group/Код/Исходники"
    touch "$group/Код/Исходники/main.c"
    touch "$group/Код/Исходники/utils.c"
    mkdir "$group/Код/Скрипты"
    touch "$group/Код/Скрипты/setup.sh"
    touch "$group/Код/Скрипты/run.sh"
    
    mkdir "$group/Отчеты"
    touch "$group/Отчеты/Отчет1.doc"
    touch "$group/Отчеты/Отчет2.doc"
done

