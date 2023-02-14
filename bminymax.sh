#!/bin/bash

maximo=$(tail -n +2 consumos.txt | sort -k4nr | head -n 1)
minimo=$(tail -n +2 consumos.txt | sort -k4n | head -n 1)


max_ciudad=$(echo "$maximo" | awk '{print $1}')
max_mes=$(echo "$maximo" | awk '{print $2}')
max_anyo=$(echo "$maximo" | awk '{print $3}')
max_consumo=$(echo "$maximo" | awk '{print $4}')


min_ciudad=$(echo "$minimo" | awk '{print $1}')
min_mes=$(echo "$minimo" | awk '{print $2}')
min_anyo=$(echo "$minimo" | awk '{print $3}')
min_consumo=$(echo "$minimo" | awk '{print $4}')


echo "La ciudad con mayor consumo fue $max_ciudad en $max_mes de $max_anyo con $max_consumo."
echo "La ciudad con menor consumo fue $min_ciudad en $min_mes de $min_anyo con $min_consumo."
