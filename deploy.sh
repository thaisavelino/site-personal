MY_IP="$(ip addr show enp0s3 | grep 'inet ' | cut -f2 | awk '{ print $2}')"
echo && echo "Welcome '$(hostname -f)' ip: ${MY_IP}" && echo "Start Pushing work at $(date)"

DEPLOY_USR_NAME="$(whoami)"
DEPLOY_APACHE_ROOT="/var/www"
DEPLOY_ROOT_THIS="${DEPLOY_APACHE_ROOT}/cv"
DEPLOY_BRANCH="$(git branch | grep "*" | awk '{ print $2}')"

echo "Pushing to	'PROD'" && echo "at Branch	'${DEPLOY_BRANCH}'" && echo "of user		'${DEPLOY_USR_NAME}'" && echo "project 	'${DEPLOY_ROOT_THIS}'"

DEPLOY_STATUS_MOD="$(git status | grep modified | cut -f2 | awk '{print $1}')"
DEPLOY_COMMAND="$(git push origin ${DEPLOY_BRANCH})"

if [ "${DEPLOY_STATUS_MOD}" = "modified:" ]; then
	#echo && echo "*************************************"
	#echo "make sure you did git add and git commit "
	#echo "*************************************" && echo
	#echo "Nothing will be done..... "
	git add .
	git commit -am "automatic deploy"
	git push origin master

	echo && echo "SUCESS Push has finished at $(date)"
	echo "*** SUCESS ***"
	echo "See you soon '$(hostname -f)' =)"
fi

DEPLOY_STATUS_PUSH="$(git status | grep up-to-date | awk '{ print $4}')"

if [ "${DEPLOY_STATUS_PUSH}" = "up-to-date" ]; then
	echo ${DEPLOY_COMMAND}
	echo && echo "SUCESS Push has finished at $(date)"
	echo "*** SUCESS ***"
	echo "See you soon '$(hostname -f)' =)"
	exit 1
fi

if [ "${DEPLOY_COMMAND}" = "Everything up-to-date" ]; then
	echo "Nothing to push"
	echo "*** SUCESS ***"
	echo "See you soon '$(hostname -f)' =)"
	exit 1
fi

if [ "${DEPLOY_COMMAND}" != "Everything up-to-date" ]; then
	echo ${DEPLOY_COMMAND}
	echo && echo "SUCESS Push has finished at $(date)"
	echo "*** SUCESS ***"
	echo "See you soon '$(hostname -f)' =)"
fi
