all:input.tex

input.tex: input.Rnw
	Rscript -e "Sweave('input.Rnw')"

clean:
	rm -f input.tex
	rm -f input.Rnw