all: preview adoc index

adoc:
	@printf "Generating README.adoc...\n"
	@./create_readme.bash

index:
	@printf "Generating index.html...\n"
	@asciidoctor README.adoc -o index.html

preview:
	@printf "Generating the preview of wallpapers...\n"
	@./generate_preview.bash
