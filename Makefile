file_names=$(basename $(basename $(wildcard *.doc.md)))
PDF=$(addsuffix .pdf, $(file_names))
TEX=$(addsuffix .tex, $(file_names))

default: $(PDF)

latex: $(TEX)

%.pdf: %.doc.md template.tex
	pandoc $< --filter pandoc-citeproc --template template.tex --pdf-engine=pdflatex -o $@

%.tex: %.doc.md template.tex
	pandoc $< --filter pandoc-citeproc --template template.tex -o $@

clean:
	rm -f $(PDF) $(TEX)
