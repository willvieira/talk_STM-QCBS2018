ASS=assets/*
CONF=conf/*
IMG=images/*
IND=index

$(IND).html: $(IND).Rmd $(IMG) $(CONF) $(ASS)
	Rscript -e "rmarkdown::render('$(IND).Rmd', 'xaringan::moon_reader')"

server:
	Rscript -e "xaringan::infinite_moon_reader('$(IND).Rmd')"

deps:
	Rscript -e 'if (!require(rmarkdown)) install.packages("rmarkdown"); library(rmarkdown); if (!require(knitr)) install.packages("knitr"); library(knitr); if(!require(devtools)) install.packages("devtools"); if (!require(xaringan)) devtools::install_github("yihui/xaringan"); library(xaringan); if (!require(pBrackets)) install.packages("pBrackets"); library(pBrackets); if (!require(latex2exp)) install.packages("latex2exp"); library(latex2exp)'

clean:
	rm -rf index_cache index_files

.PHONY: server clean
