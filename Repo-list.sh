#!/bin/bash
set -e
endpoint=https://github.com
org=pagopa
central_repo=eng-github-authorization
max_proc=9
product=selfcare

if [ ! -d "$central_repo" ] ; then
	echo "extracting repo list"
	git clone $endpoint/$org/$central_repo
fi
echo "cloning repos"
rg -I 'repo_name' --type json | cut -d '"' -f 4 | grep "^$product" | jq -R -s -c 'split("\n")[:-1]'
