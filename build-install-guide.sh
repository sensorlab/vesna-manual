# script for building a document
# arg 1: the name of the document file
# to be started from the source dircetory

OUT_DIR=./build/

latex --shell-escape -interaction=nonstopmode -output-directory $OUT_DIR install-guide-linux.tex

latex --shell-escape -interaction=nonstopmode -output-directory $OUT_DIR install-guide-linux.tex

pdflatex --shell-escape -interaction=nonstopmode -output-directory $OUT_DIR install-guide-linux.tex

pdflatex --shell-escape -interaction=nonstopmode -output-directory $OUT_DIR install-guide-linux.tex 
