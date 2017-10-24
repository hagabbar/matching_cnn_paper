DOCS = match_cnn_paper.pdf

FIGS = ./figures/waveform.pdf \
    ./figures/loss.pdf \
    ./figures/confusion_matrix.pdf \
    ./figures/efficiency.pdf \
    ./figures/ROC_curves.pdf

TABLES = 

BIBLIO = ./references.bib

BYPROD = *.aux *.log *.out *.dvi *.bbl *.blg

default: git-tag $(DOCS) $(FIGS)

.PHONY : git-tag

git-tag:
	./git-tag.sh

match_cnn_paper.pdf: match_cnn_paper.tex $(FIGS) $(TABLES) $(BIBLIO)
	pdflatex $(@:.pdf=) && bibtex $(@:.pdf=) && pdflatex $(@:.pdf=) && pdflatex $(@:.pdf=) && pdflatex $(@:.pdf=)

clean:
	rm -f $(DOCS) $(BYPROD)
