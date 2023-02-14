#!/bin/bash

media_min=999
ciudad_min=""

while read -r ciudad; do
    media=$(./cmedia.sh "$ciudad")
    if ((media < media_min)); then
        media_min=$media
        ciudad_min=$ciudad
    fi
done <<- EOF
$(sed 1d consumos.txt | awk '{print $1}')
EOF

echo "La ciudad con la media de consumos más baja es: $ciudad_min"