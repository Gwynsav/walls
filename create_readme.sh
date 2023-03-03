#!/bin/sh

# Header of the README
printf "= walls\nPersonal collection of wallpapers." > README.adoc

for dir in $(find . -maxdepth 1 -type d \! -name ".git" \! -name "." \! -name "docs")
do
	dir_basename=$(basename "${dir}")
	printf "\n\n== %s" "${dir_basename}" >> README.adoc
done

# Remove the "no newline at the end of file"
printf "\n" >> README.adoc
