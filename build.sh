#!/bin/bash

NODE="/bin/node"
NAME="206neutrinos"

MAIN="./main.coffee"

SRC=(
	$MAIN
	./src/argvParser.coffee
	./src/updateRecords.coffee
)

function get_dist {
	echo $1 | sed -e 's/.coffee/.js/g'
}

function compile {
	src=$1
	dist=$(get_dist $src)

	coffee -c $src
	sed -i -E "s/(require\(.*).coffee([\'\"]\))/\1.js\2/" $dist
}

for i in ${SRC[@]}; do
	compile $i
done

main_dist=$(get_dist $MAIN)
echo '#!/bin/node' > $NAME
cat $main_dist >> $NAME
chmod +x $NAME
