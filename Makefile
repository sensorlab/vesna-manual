DOCS = install-guide-linux.tex

LATEX = latex 
PDFLATEX = pdflatex

# FIXME: nonstopmodeis necessary because includegraphics wants a "bb"
# bounding box option for including png images, which is missing in our .tex
# file. But we don't want to include the size of each image in there, since 
# by default it finds out the bounding box just fine.
#
# Unfortunately this means we can't know whether LaTeX threw up any other
# errors.
LATEX_OPTS = -interaction=nonstopmode

all: $(DOCS:.tex=.pdf)

%.pdf: %.tex
	while ($(PDFLATEX) $(LATEX_OPTS) $< ; \
		grep -q "Rerun to get cross" $(<:.tex=.log)) do true; \
	done

%.d: %.tex
	-$(LATEX) $(LATEX_OPTS) $<
	echo -n "$(<:.tex=.pdf): " > $@
	sed -ne '/^File: \./{s/.*: //;s/ .*/ \\/;p}' \
		$(<:.tex=.log) >> $@

clean:
	rm -f *.d *.aux *.dvi *.log *.lof *.out *.toc *.pdf

.PHONY: all clean

-include $(DOCS:.tex=.d)
