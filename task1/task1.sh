#!/bin/bash

show_help() {
	cat <<EOF
Usage: ${0##*/} [OPTIONS] [ARGUMENTS...]

Options:
    -h, --help      Show this help message and exit.
    -f, --file FILE Specify an input file.

Examples:
    ${0##*/} --file input.txt
EOF
}

check_url() {
	while IFS= read -r line; do
		local response

		echo -n "Checking availablitiy for $line... "
		response=$(curl -s -o /dev/null -w "%{http_code}" "$line")
		echo "$response"

		if [[ ! "$response" =~ [23][0-9]{2} ]]; then
			exit
		fi

	done <"$1"
}

if [[ "$#" -eq 0 ]]; then
	show_help
	exit 0
fi

case "$1" in
-h | --help)
	show_help
	exit 0
	;;
-f | --file)
	if [[ -n "$2" && -f "$2" ]]; then
		check_url "$2"
		shift 2
	else
		echo "Error: no file provided or file does not exist"
		show_help
		exit 1
	fi
	;;
*)
	echo "Error: Unknown option '$1'."
	show_help
	exit 1
	;;
esac
