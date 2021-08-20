#!/bin/sh

set -ev

Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::gitbook')"
Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::epub_book')"
Rscript -e "bookdown::render_book('index.Rmd', 'bookdown::pdf_book')"
Rscript -e "pgs <- qpdf::pdf_length('_book/data-management-sop.pdf');qpdf::pdf_subset('_book/data-management-sop.pdf', pages = c(2:pgs), output = '_book/subset.pdf')"
Rscript -e "qpdf::pdf_combine(c('www/SOP Cover.pdf', '_book/subset.pdf'), output = '_book/data-management-sop.pdf'); file.remove('_book/subset.pdf')"

