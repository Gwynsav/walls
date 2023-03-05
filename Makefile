index:
	./create_readme.bash
	asciidoctor README.adoc -o index.html

preview:
	./generate_preview.bash
