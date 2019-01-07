NO_COLOR=\x1b[0m
OK_COLOR=\x1b[32;01m
ERROR_COLOR=\x1b[31;01m
WARN_COLOR=\x1b[33;01m
OK_STRING=$(OK_COLOR)[OK]$(NO_COLOR)
ERROR_STRING=$(ERROR_COLOR)[ERRORS]$(NO_COLOR)
WARN_STRING=$(WARN_COLOR)[WARNINGS]$(NO_COLOR)

all:
	@echo "Doing all"
	@echo "Pushing to production"
	@git add .
	@git commit -am "merge into master"
	@git push origin test
	@git checkout master
	@git merge test
	make deploy

deploy:
	@git add .
	@git commit -am "automatic deploy"
	@git push origin master

test:
	@echo "Pushing to test"
	@git checkout test
	@git merge feaure
	@git add .
	@git commit -am "Testing before deploy"
	@git push origin test

update:
	@echo "Makefile: Doing UPDATE stuff like grunt, gulp, rake,..."
	@whoami
	@pwd
