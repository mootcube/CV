all: clean_pdf CV-Mathieu-Chataigner.pdf Resume-Mathieu-Chataigner.pdf
	make clean

%.pdf:	%.tex
	pdflatex $< > /dev/null
	pdflatex $< > /dev/null
#	pdftk $@ dump_data output info.txt
#	cat info.txt | recode utf8 > report.txt
#	latex $< > /dev/null
#	latex $< > /dev/null
#	dvipdfmx $(<:.tex=.dvi) 2> /dev/null
#	pdftk $@ update_info report.txt output temp.pdf
#	cp temp.pdf $@
	@echo "$@ generated"

cv:
	pdflatex CV-Mathieu-Chataigner.tex
	pdflatex CV-Mathieu-Chataigner.tex

resume:
	pdflatex Resume-Mathieu-Chataigner.tex
	pdflatex Resume-Mathieu-Chataigner.tex

clean_pdf:	clean
	rm -f *.pdf

clean:
	rm -f *.log *.aux *.out *~ info.txt report.txt *.dvi

arch:	clean
	rm -f CV.zip
	zip -r CV.zip .
