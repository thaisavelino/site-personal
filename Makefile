NO_COLOR=\x1b[0m
OK_COLOR=\x1b[32;01m
ERROR_COLOR=\x1b[31;01m
WARN_COLOR=\x1b[33;01m
OK_STRING=$(OK_COLOR)[OK]$(NO_COLOR)
ERROR_STRING=$(ERROR_COLOR)[ERRORS]$(NO_COLOR)
WARN_STRING=$(WARN_COLOR)[WARNINGS]$(NO_COLOR)

all: update deploy
	@echo "Doing all"

deploy:
	@git add .
	@git commit -am "automatic deploy"
	@git push origin master

update:
	@echo "Welcome to the Server"
	@whoami
	@echo "Makefile doing UPDATE \n ... stuff like grunt, gulp, rake,... \n..."
	@pwd
