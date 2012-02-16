all: clean_pdf cv CV-Mathieu-Chataigner.pdf Resume-Mathieu-Chataigner.pdf
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
	xsltproc xml/cv_latex.xsl xml/cv.xml > cv.tex
	pdflatex cv.tex > /dev/null
	pdflatex cv.tex > /dev/null
	@echo "cv.pdf generated"

resume:
	pdflatex Resume-Mathieu-Chataigner.tex
	pdflatex Resume-Mathieu-Chataigner.tex

clean_pdf:	clean
	rm -f *.pdf

clean:
	rm -f *.log *.aux *.out *~ info.txt report.txt *.dvi cv.tex CV.zip CV.tar.xz CV_latex.tar.xz CV_web.tar.xz CV_latex.tar CV_web.tar

arch:	clean
	rm -f CV.zip
	zip -r CV.zip .

tar:	clean
	rm -f CV.zip
	rm -f CV.tar.xz
	tar cvvJf CV.tar.xz *
	@echo "CV.tar.xz generated"

web:	clean
	tar cvvJf CV_latex.tar.xz Makefile moderncv.cls pdftex.cfg *.sty xml/cv.xml xml/cv_latex.xsl
	@echo "CV_latex.tar.xz generated"
	@echo pwd
	tar cvvf CV_web.tar CV_latex.tar.xz
	tar rvvCf xml CV_web.tar cv.xml cv_html.xsl css
	xz CV_web.tar
	@echo "CV_web.tar.xz generated"

