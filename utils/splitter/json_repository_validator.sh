#!/bin/bash

json_file = $1
# Estrai la lunghezza dell'array "repositories" con jq
count=$(echo "$json_file" | jq '.repositories | length')

# Controlla se ci sono almeno 1 elemento
if [[ "$count" -le 1 ]]; then
    echo "No repository found"
    exit 0
fi
