TEX=./tex
PDF=./pdfs

all: $(PDF)/algo-analysis.pdf $(PDF)/logic-programming.pdf $(PDF)/databases.pdf $(PDF)/computational-processes.pdf

$(PDF)/%.pdf: $(TEX)/%.tex
	cp $(TEX)/$*.tex{,1}
	cd $(TEX); xelatex $*.tex
	cp $(TEX)/$*.pdf $(PDF)
	rm $(TEX)/*

$(TEX)/%.tex: %/
	python texify.py $< > $@	
