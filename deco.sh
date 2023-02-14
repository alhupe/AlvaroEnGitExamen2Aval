#!/bin/bash

while true;do
    

    clear
    

    if grep -q "^$1 " consumos.txt; then
        
        consumototal=$(awk -v ciudad=$1 '$1 == ciudad {consumo += $4} END {print consumo}' consumos.txt)
        
        mes=$(grep -c "^$1 " consumos.txt)
        
        media=$(echo "$consumototal / $mes" | bc)

	if $media < 400; then

	echo "Es ECO."

	else
	echo "NO ECO."

	fi
        
        echo "La media de consumo de $1 es $media."
        
        break

    else
        read -p "Introduce una ciudad válida: " ciudad
        set -- "$ciudad"
    fi

	

done