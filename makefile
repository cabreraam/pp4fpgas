JOBNAME = main
FILENAME = $(JOBNAME)

.PHONY: all
all: single

.PHONY:
single:
	latexmk -jobname=$(JOBNAME)
	cp build/$(JOBNAME).pdf $(FILENAME).pdf

.PHONY: cont
cont:
	latexmk -pvc -jobname=$(JOBNAME)

.PHONY: present
present: single
	pdfpc $(FILENAME).pdf

.PHONY: html
html:
	ebb -x inkscape/*.pdf
	ebb -x figures/*.pdf
	ebb -x figures/*.png
	htlatex $(JOBNAME)

.PHONY: clean
clean:
	rm -rf build
