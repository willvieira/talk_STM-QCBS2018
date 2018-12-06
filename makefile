ASS=assets/*
CONF=conf/*
IMG=images/*
IND=index

$(IND).html: $(IND).Rmd $(IMG) $(CONF) $(ASS)
	Rscript -e "rmarkdown::render('$(IND).Rmd', 'xaringan::moon_reader')"

server:
	Rscript -e "xaringan::infinite_moon_reader('$(IND).Rmd')"

.PHONY: server
