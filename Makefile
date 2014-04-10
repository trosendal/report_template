chapters = $(sort $(dir $(wildcard chapters/*/)))

all:report.pdf

buildchapRnw:
	Rscript R/text_to_sweave.R

buildchaptex:buildchapRnw
	$(foreach dir,$(chapters),(cd $(dir) ; make) &&) :

modifytex: buildchaptex
	Rscript R/modify_chapters_for_inclusion.R

report.pdf: report.tex modifytex
	Rscript -e "tools::texi2pdf('report.tex')"

sweep:
	rm -f *.aux
	rm -f *.log
	rm -f *.out
	rm -f *.toc
	$(foreach dir,$(chapters),(cd $(dir) ; make clean) &&) :


clean:sweep
	rm -f *.pdf
