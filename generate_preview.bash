#!/bin/bash

#ffmpeg -i input.jpg -vf scale=320:240 output_320x240.png

# $1 : folder
# $2 : extension .png or .jpg
generate_preview_extension () {
	find "${1}" -type f -name "*.${2}" -print0 | while IFS= read -r -d '' file
	do
		file_basename=$(basename "${file}" ${2})
		echo ffmpeg -i ${file} -vf scale=320:-1 $(dirname ${file})/preview_${file_basename}${2}
	done
}

generate_preview () {
	generate_preview_extension "${1}" png
	generate_preview_extension "${1}" jpg
}

add_titles_and_preview () {
	echo
	find . -maxdepth 1 -type d \! -name ".git" \! -name "." \! -name "docs" -print0 | while IFS= read -r -d '' file
	do
		dir_basename=$(basename "${file}")
		generate_preview "${dir_basename}"
	done
}

add_titles_and_preview
