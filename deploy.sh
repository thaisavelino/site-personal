MY_IP="$(ip addr show enp0s3 | grep 'inet ' | cut -f2 | awk '{ print $2}')"
echo && echo "Welcome '$(hostname -f)' ip: ${MY_IP}" && echo "Start Pushing work at $(date)" && echo

DEPLOY_USR_NAME="$(whoami)"
DEPLOY_APACHE_ROOT="/var/www"
DEPLOY_ROOT_THIS="${DEPLOY_APACHE_ROOT}/cv"
DEPLOY_BRANCH="$(git branch | grep "*" | awk '{ print $2}')"
DEPLOY_STATUS_MOD="$(git status | grep modified | cut -f2 | awk '{print $1}')"
DEPLOY_STATUS_PUSH="$(git status | grep up-to-date | awk '{print $4}')"
DEPLOY_COMMAND="$(git push origin ${DEPLOY_BRANCH})"

echo "Pushing to	'PROD'" && echo "at Branch	'${DEPLOY_BRANCH}'" && echo "of user		'${DEPLOY_USR_NAME}'" && echo "project 	'${DEPLOY_ROOT_THIS}'"


if [ "${DEPLOY_STATUS_MOD}" = "modified:" ]; then
	echo && echo "*************************************"
	echo "make sure you did git add and git commit "
	echo "*************************************" && echo
	echo "Nothing will be done..... "

	exit 1
fi

if [ "${DEPLOY_STATUS_PUSH}" = "up-to-date" ]; then
	git add .
	git commit -am "automatic deploy"
	git push origin master
	echo && echo "SUCESS Push has finished at $(date)"
	echo "*** SUCESS up-to-date ***"
	echo "See you soon '$(hostname -f)' =)"
fi

if [ "${DEPLOY_COMMAND}" = "Everything up-to-date" ]; then
	echo "Nothing to push"
	echo "*** SUCESS e ***"
	echo "See you soon '$(hostname -f)' =)"
	exit 1
fi

$(git add .)
$(git commit -am "automatic")
$(git push origin master)
echo && echo "SUCESS Push has finished at $(date)"
echo "*** SUCESS end ***"
echo "See you soon '$(hostname -f)' =)"
