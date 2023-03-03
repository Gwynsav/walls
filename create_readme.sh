#!/bin/bash

# Header of the README
printf "= walls\nPersonal collection of wallpapers." > README.adoc

find . -maxdepth 1 -type d \! -name ".git" \! -name "." \! -name "docs" -print0 | while IFS= read -r -d '' file
do
	dir_basename=$(basename "${file}")
	printf "\n\n== %s" "${dir_basename}" >> README.adoc
done

# Remove the "no newline at the end of file"
printf "\n" >> README.adoc
