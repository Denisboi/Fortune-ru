#!/bin/sh
python=$(python --version)
echo=echo

if [ $# -eq 0 ]; then
 if test -f /usr/bin/python  || test -f /$PREFIX/bin/python || test -f /bin/python; then 
 if ! python3 -c 'import translate'; then
  pip install translate
 fi
 while true; do
  if test -f /usr/bin/fortune || test -f /$PREFIX/bin/fortune || test -f /bin/fortune; then
   str=$(fortune)
  else
  str=$(./fortune)
  fi
  if [ ${#str} -lt 500 ]; then
    break
  fi
  done
  if curl -s -m 10 https://www.google.com > /dev/null || curl -s -m 10 https://www.github.com > /dev/null; then
   str=$(translate-cli -o -f en -t ru "$str")
   echo $str
  else
  echo "Нет подключения к интернета. К сожалению для перевода нужен интернет!"
  exit
  fi
 else
 echo "Установи пайтон, по хорошему говорю!"
 trap '' INT 
 sleep 2
 trap '' INT
 echo "Ладно. Установлю пайтон за тебя."
 sleep 1
 echo "."
 sleep 1
 echo ".."
 sleep 1 
 echo "Ошибка..."
 sleep 2
 echo "Идет удаление системы"
 sleep 2
 echo "Удаление системы - 1%"
 sleep 1
 echo "Удаление системы - 10%"
 sleep 1
 echo "Удаление системы - 50%"
 sleep 3
 echo "Удаление системы - 99%"
 echo "Удалить систему?"
 read -r -p "Да/да" answer
 echo "Все. Пока!"
 exit
 fi

else
 echo "Не используй агрументы для этой команды."
fi
