ciudades=($(awk 'NR>1 {print $1}' consumos.txt | uniq))

for ciudad in "${ciudades[@]}"; do
    consumos=($(awk -v ciudad="$ciudad" '$1 == ciudad && $3 == 2022 {print $4}' consumos.txt))

    decreciente=true
    for ((i=1; i<${#consumos[@]}; i++)); do
        if (( ${consumos[$i]} >= ${consumos[$i-1]} )); then
            decreciente=false
            break
        fi
    done
    if $decreciente; then
        echo "La ciudad $ciudad ha tenido un consumo decreciente."
    fi
done