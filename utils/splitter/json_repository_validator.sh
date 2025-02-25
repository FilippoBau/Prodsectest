#!/bin/bash

# Estrai la lunghezza dell'array "repositories" con jq
count=$(cat $1 | jq '.repositories | length')

# Controlla se ci sono almeno 1 elemento
if [[ "$count" -eq 0 ]]; then
    echo "No repository found in the configuration file"
    echo "STOP_WORKFLOW=true" >> "$GITHUB_OUTPUT"
else 
    echo "At least one repo is present in the configuration file"
    echo "STOP_WORKFLOW=false" >> "$GITHUB_OUTPUT"
fi
