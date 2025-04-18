ф#!/bin/bash

set -e

mkdir -p ./out

pdflatex -output-directory=./out main.tex
mv references.bib ./out

pushd ./out > /dev/null
bibtex main
mv references.bib ..
popd > /dev/null

pdflatex -output-directory=./out main.tex
pdflatex -output-directory=./out main.tex

mv ./out/main.pdf ./main.pdf

