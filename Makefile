# The shell we use
SHELL := /bin/bash

# We like colors
# From: https://coderwall.com/p/izxssa/colored-makefile-for-golang-projects
RED=`tput setaf 1`
GREEN=`tput setaf 2`
RESET=`tput sgr0`
YELLOW=`tput setaf 3`

# Add the following 'help' target to your Makefile
# And add help text after each target name starting with '\#\#'
.PHONY: help
help: ## This help message
	@echo -e "$$(grep -hE '^\S+:.*##' $(MAKEFILE_LIST) | sed -e 's/:.*##\s*/:/' -e 's/^\(.\+\):\(.*\)/\\x1b[36m\1\\x1b[m:\2/' | column -c2 -t -s :)"

.PHONY: html
html: ## Building HTML
	@echo ""
	@echo "$(YELLOW)==> Buildinig HTML $(VERSION)$(RESET)"
	@docker run -it --rm -v `pwd`:/docs testthedocs/ttd-mkdocs:latest build

.PHONY: serve
serve: ## Startiing in serve mode
	@echo ""
	@echo "$(YELLOW)==> Starting in serve mode $(VERSION)$(RESET)"
	@docker run -it --rm -p 8000:8000 -v `pwd`:/docs testthedocs/ttd-mkdocs:latest serve
