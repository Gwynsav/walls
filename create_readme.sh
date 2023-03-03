#!/bin/bash

list_wall_of_a_folder () {
	find "${1}" -type f \! -name "preview_*" -print0 | while IFS= read -r -d '' file
	do
		file_basename=$(basename "${file}" .jpg)
		file_basename=$(basename "${file_basename}" .png)
		printf "\n\n=== %s" "${file_basename}" >> README.adoc
		printf "\n\nimage::%s/preview_%s[scaledwidth=50%%]" "$(dirname ${file})" "$(basename ${file})" >> README.adoc
	done
}

add_titles_and_preview () {
	find . -maxdepth 1 -type d \! -name ".git" \! -name "." \! -name "docs" -print0 | while IFS= read -r -d '' file
	do
		dir_basename=$(basename "${file}")
		printf "\n\n== %s" "${dir_basename}" >> README.adoc
		list_wall_of_a_folder "${dir_basename}"
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
