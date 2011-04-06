#!/bin/sh
rm -f *out *log *aux *dvi info.txt report.txt

pdflatex CV-Mathieu-Chataigner.tex
pdflatex CV-Mathieu-Chataigner.tex
pdftk CV-Mathieu-Chataigner.pdf dump_data output info.txt
cat info.txt | recode html/.. > report.txt
latex CV-Mathieu-Chataigner.tex
latex CV-Mathieu-Chataigner.tex 2> /dev/null
dvipdfmx CV-Mathieu-Chataigner.dvi 2> /dev/null
pdftk CV-Mathieu-Chataigner.pdf update_info report.txt output CV-Mathieu-Chataigner.pdf2
pdftk CV-Mathieu-Chataigner.pdf update_info report.txt output CV-Mathieu-Chataigner.pdf2
mv CV-Mathieu-Chataigner.pdf2 CV-Mathieu-Chataigner.pdf

rm -f *out *log *aux *dvi info.txt report.txt
echo "CV compiled"
pdflatex Resume-Mathieu-Chataigner.tex
pdflatex Resume-Mathieu-Chataigner.tex
pdftk Resume-Mathieu-Chataigner.pdf dump_data output info.txt
cat info.txt | recode html/.. > report.txt
latex Resume-Mathieu-Chataigner.tex
latex Resume-Mathieu-Chataigner.tex 2> /dev/null

dvipdfmx Resume-Mathieu-Chataigner.dvi 2> /dev/null
pdftk Resume-Mathieu-Chataigner.pdf update_info report.txt output Resume-Mathieu-Chataigner.pdf2
pdftk Resume-Mathieu-Chataigner.pdf update_info report.txt output Resume-Mathieu-Chataigner.pdf2
mv Resume-Mathieu-Chataigner.pdf2 Resume-Mathieu-Chataigner.pdf


rm -f *out *log *aux *dvi info.txt report.txt
