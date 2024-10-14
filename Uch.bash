#!/bin/bash

add_grades() {
    local course=$1

    read -p "Сколько студентов в группе? " number_of_students
    echo "Добавьте фамилии студентов:"

    for ((i=1; i<=number_of_students; i++)); do
        read -p "Студент $i: " student_name
        read -p "Введите оценку для $student_name: " grade
        echo "Студент: $student_name, Оценка: $grade" >> "$course/Оценки.txt"
    done

    echo "Оценки добавлены в файл \"Оценки.txt\" для курса \"$course\"."
}

read -p "Укажите название курса: " course_name

if [ ! -d "$course_name" ]; then
    mkdir "$course_name"
    echo "Создана папка для курса \"$course_name\"."
else
    echo "Папка для курса \"$course_name\" уже существует."
fi

mkdir -p "$course_name/Студенты"

touch "$course_name/Оценки.txt"

add_grades "$course_name"

edit_grades() {
    local course=$1
    local grades_file="$course/Оценки.txt"

    echo "Текущие оценки:"
    cat "$grades_file"

    read -p "Введите фамилию студента для редактирования оценки: " student_name
    read -p "Введите новую оценку для $student_name: " new_grade

    awk -v name="$student_name" -v grade="$new_grade" \
    '{if($2==name) {$4=grade} print}' "$grades_file" > "$grades_file.tmp" && mv "$grades_file.tmp" "$grades_file"

    echo "Оценка для $student_name обновлена."
}

read -p "Хотите ли вы редактировать оценки? (y/n): " edit_choice
if [ "$edit_choice" == "y" ]; then
    edit_grades "$course_name"
fi

echo "Работа скрипта завершена."
