#!/bin/bash

add_titles_and_preview () {
	find . -maxdepth 1 -type d \! -name ".git" \! -name "." \! -name "docs" -print0 | while IFS= read -r -d '' file
	do
		dir_basename=$(basename "${file}")
		printf "\n\n== %s" "${dir_basename}" >> README.adoc
	done
}

main () {

	# Header of the README
	printf "= walls\nPersonal collection of wallpapers." > README.adoc

	add_titles_and_preview

	# Remove the "no newline at the end of file"
	printf "\n" >> README.adoc
}

main
