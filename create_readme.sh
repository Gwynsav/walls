#!/bin/sh

# Header of the README
printf "= walls\nPersonal collection of wallpapers." > README.adoc

find . -maxdepth 1 -type d \! -name ".git" \! -name "." \! -name "docs" -exec sh -c '
	dir_basename=$(basename "${1}")
	printf "\n\n== %s" "${dir_basename}" >> README.adoc
' sh {} \;

# Remove the "no newline at the end of file"
printf "\n" >> README.adoc
