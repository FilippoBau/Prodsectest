#!/bin/bash

# Estrai il contenuto di repositories dal file json
repositories=$(jq -r '.repositories[]' repo.json)

# Conta il numero totale di elementi
total=$(echo "$repositories" | wc -l)

# Calcola il punto di divisione
split=$(( (total + 1) / 2 ))

# Dividi in due parti
list1=$(echo "$repositories" | head -n "$split")
list2=$(echo "$repositories" | tail -n +$((split + 1)))

# Crea due file json temporanei
echo "$list1" > tmp/repo_list1.json
echo "$list2" > tmp/repo_list2.json
