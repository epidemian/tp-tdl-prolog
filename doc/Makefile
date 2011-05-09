# A very stupid makefile xD

sourcefiles  = $(shell find ../src -name '*\.pl')

# Not stop on errors.
texflags = -interaction=nonstopmode

# Uncomment to supress the fu***** pdflatex command.
#quiet = yes

ifdef quiet
texflags += > /dev/null
endif 

.PHONY = all clean veryclean

all : informe.pdf

informe.pdf : informe.tex $(sourcefiles)
	pdflatex $(texflags) informe.tex
	
clean :
	@rm -vf *.aux *.toc *.log *.nav *.out *.snm *.vrb

veryclean: clean
	@rm -vf informe.pdf
