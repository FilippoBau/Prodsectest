#!/bin/bash

# Estrai la lunghezza dell'array "repositories" con jq
echo "$1"
count=$(echo "$1" | jq '.repositories | length')

# Controlla se ci sono almeno 1 elemento
if [[ "$count" -le 1 ]]; then
    echo "No repository found"
    exit 0
fi
