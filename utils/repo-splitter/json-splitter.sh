#!/bin/bash

# Estrai il contenuto di repositories dal file json
repositories=$(jq -r '.repositories[]' ../../repo.json)

# Conta il numero totale di elementi
total=$(echo "$repositories" | wc -l)

# Calcola il punto di divisione
split=$(( (total + 1) / 2 ))

# Dividi in due parti
list1=$(echo "$repositories" | head -n "$split")
list2=$(echo "$repositories" | tail -n +$((split + 1)))

# Crea il primo file json
jq --argjson list1 "$(echo "$list1" | jq -Rsc 'split("\n")[:-1]')" \
   '.repositories = $list1' templateRepo.json > jsonRepo1.json

# Crea il secondo file json
jq --argjson list2 "$(echo "$list2" | jq -Rsc 'split("\n")[:-1]')" \
   '.repositories = $list2' templateRepo.json > jsonRepo2.json
