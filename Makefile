help: ## Show this help
	@echo "Targets:"
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/\(.*\):.*##[ \t]*/    \1 ## /' | sort | column -t -s '##'
	@echo

build: ## Build container
	docker build -t node-docker-workflow .

start: ## Start built container
	docker container run -p 3000:3000 node-docker-workflow
