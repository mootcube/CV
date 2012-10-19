all: clean clean_pdf qr cv


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

qr:
	xsltproc -o qr.tex xml/cv_latex_qr.xsl xml/cv.xml
	pdflatex -shell-escape qr.tex > /dev/null 2> /dev/null
	pdflatex -shell-escape qr.tex > /dev/null 2> /dev/null

cv:
	xsltproc -o cv.tex xml/cv_latex.xsl xml/cv.xml
	pdflatex cv.tex > /dev/null
	pdflatex cv.tex 
	@echo "cv.pdf generated"
	cp cv.pdf CV-Mathieu-Chataigner.pdf

resume:
	pdflatex Resume-Mathieu-Chataigner.tex
	pdflatex Resume-Mathieu-Chataigner.tex

clean_pdf:	clean
	rm -f *.pdf

clean:
	rm -f *.log *.aux *.out *~ info.txt report.txt *.dvi cv.tex qr.tex CV.zip CV.tar.xz CV_latex.tar.xz CV_web.tar.xz CV_latex.tar CV_web.tar
	rm -rf web/*



arch:	clean
	rm -f CV.zip
	zip -r CV.zip .

tar:	clean
	rm -f CV.zip
	rm -f CV.tar.xz
	tar cvvJf CV.tar.xz *
	@echo "CV.tar.xz generated"

folder:	cv clean
	tar cvvJf CV_latex.tar.xz Makefile moderncv.cls pdftex.cfg *.sty xml/cv.xml xml/cv_latex.xsl
	@echo "CV_latex.tar.xz generated"
	mkdir -p web
	cp CV_latex.tar.xz cv.pdf CV-Mathieu-Chataigner.pdf xml/cv.xml web
	rsync -auv xml/css web/

dev:	folder
	cp xml/cv_html_dev.xsl web/cv_html.xsl
	cp xml/dev.js web/script.js

prod:	folder clean
	xsltproc -o xml/cv.html xml/cv_html.xsl xml/cv.xml
	cp -r xml/cv_html.xsl xml/script.js xml/js xml/img xml/css xml/cv.html web

web:	cv clean
	tar cvvJf CV_latex.tar.xz Makefile moderncv.cls pdftex.cfg *.sty xml/cv.xml xml/cv_latex.xsl
	@echo "CV_latex.tar.xz generated"
	tar cvvf CV_web.tar CV_latex.tar.xz CV-Mathieu-Chataigner.pdf
	tar rvvCf xml CV_web.tar cv.xml cv_html.xsl index.php css
	xz CV_web.tar
	@echo "CV_web.tar.xz generated"

