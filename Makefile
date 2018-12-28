all:
	@echo "Doing all"

deploy:
	@echo "Pushing to production"
	@git add .
	@git commit -am "automatic deploy"
	@git push origin master

update:
	@echo "Makefile: Doing UPDATE stuff like grunt, gulp, rake,..."
	@whoami
	@pwd
