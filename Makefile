PDF=$(addsuffix .pdf, $(basename $(basename $(wildcard *.doc.md))))

default: $(PDF)

%.pdf: %.doc.md template.tex
	pandoc $< --filter pandoc-citeproc --template template.tex -o $@

clean:
	rm -f $(PDF)
