#!/bin/bash
# JSON.parse( $('meta[name="ol-projects"]').attr('content') ); // copy
cat data.json | jq -r 'map([.id, .name] | join("\t") ) | join("\n")' > list.csv

DATA=`cat list.csv`

IFS="
"

mkdir -p ./all
cd ./all


function uriencode { jq -nr --arg v "$1" '$v|@uri'; }

cred=false

for i in $DATA ; do
	id="${i%%	*}"
	name="${i##*	}"

	if [ -d "./$name" ]; then
		git -C "./$name" remote update
	else

		if [ "$cred" = false ]; then
			read -p "Username: " USERNAME
			read -sp "Password: " PASSWORD
			USERNAME=`uriencode "$USERNAME"`
			PASSWORD=`uriencode "$PASSWORD"`
			cred=true
		fi

		git clone --mirror --progress "https://$USERNAME:$PASSWORD@git.overleaf.com/$id" "$name"
	fi
done

cd - > /dev/null
