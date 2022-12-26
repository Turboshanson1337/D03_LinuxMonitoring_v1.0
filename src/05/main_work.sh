#!/bin/bash

# считаем папки
echo "Total number of folders (including all nested ones) = $(find $1* 2>/dev/null -type d| wc -l)"
# выводим топ 5 файлов по размеру в порядке убывания
echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
echo "$(find $1* -type d -exec du -ch {} + 2>/dev/null | grep -v total | sort -hr | head -5 | awk '{print NR, "-", $2"/, "$1}')"
# Общее кол-во файлов
echo "Total number of files = $(ls -laR $1* 2>/dev/null | grep ^- | wc -l)"
# Число конфигурационных файлов, текстовых файлов, исполняемых файлов, логов, архивов, символических ссылок
echo "Number of:"
echo "Configuration files (with the .conf extension) = $(find $1* 2>/dev/null -type f -iname "*.conf" | wc -l)"
echo "Text files = $(find $1* 2>/dev/null -type f -iname "*.txt" | wc -l)"
echo "Executable files = $(find $1* 2>/dev/null -type f -executable | wc -l)"
echo "Log files (with the extension .log) = $(find $1* 2>/dev/null -type f -iname "*.log" | wc -l)"
echo "Archive files = $(find $1* 2>/dev/null -type f -name "*.zip" -o -name "*.7z" -o -name "*.rar" -o -name "*.tar" | wc -l)"
echo "Symbolic links = $(find $1* 2>/dev/null -type l | wc -l)"
# Топ 10 файлов с самым большим весом в порядке убывания (путь, размер и тип)
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
for (( i=1; i<=10; i++))
do
    file=$(find $1* 2>/dev/null -type f -exec du -h {} + | sort -rh | head -10 | sed "${i}q;d")
    if ! [[ -z $file ]]; then
        echo -n "$i - "
        echo -n "$(echo $file | awk '{print $2",", $1}'), "
        echo "$(echo $file | grep -m 1 -o -E "\.[^/.]+$" | awk -F . '{print $2}')"
    fi
done
# Топ 10 исполняемых файлов с самым большим весом в порядке убывания (путь, размер и хеш)
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
for (( i=1; i<=10; i++))
do
    file=$(find $1* 2>/dev/null -type f -executable -exec du -h {} + | sort -rh | head -10 | sed "${i}q;d")
    if ! [[ -z $file ]]; then
        echo -n "$i - "
        echo -n "$(echo $file | awk '{print $2",", $1}'), "
        path=$(echo $file | awk '{print $2}')
        hash=$(md5sum $path | awk '{print $1}')
        echo "$hash"
    fi
done