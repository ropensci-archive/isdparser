RSCRIPT = Rscript --no-init-file

revdep:
	${RSCRIPT} -e "revdepcheck::revdep_reset(); revdepcheck::revdep_check()"

install: doc build
	R CMD INSTALL . && rm *.tar.gz

build:
	R CMD build .

doc:
	${RSCRIPT} -e "devtools::document()"

eg:
	${RSCRIPT} -e "devtools::run_examples()"

check:
	${RSCRIPT} -e "devtools::check(document = FALSE, cran = TRUE)"

test:
	${RSCRIPT} -e "devtools::test()"

pkgdocs:
	${RSCRIPT} -e "pkgdown::build_site()"
