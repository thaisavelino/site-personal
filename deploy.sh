DEPLOY_USR_NAME="$(whoami)"
DEPLOY_APACHE_ROOT="/var/www"
DEPLOY_ROOT_THIS="${DEPLOY_APACHE_ROOT}/cv"
DEPLOY_BRANCH="$(git branch | grep "*" | awk '{ print $2}')"
DEPLOY_COMMAND="$(git push origin ${DEPLOY_BRANCH})"
DEPLOY_STATUS-"$(git status | grep modified)"

MY_IP="$(ip addr show enp0s3 | grep 'inet ' | cut -f2 | awk '{ print $2}')"
echo && echo "Welcome '$(hostname -f)' ip: ${MY_IP}" && echo "Start Pushing work at $(date)"

echo "Pushing to	'PROD'" && echo "at Branch	'${DEPLOY_BRANCH}'" && echo "of user		'${DEPLOY_USR_NAME}'" && echo "project 	'${DEPLOY_ROOT_THIS}'"

if [ DEPLOY_STATUS ]; then
	echo && echo "*************************************"
	echo "make sure you did git add and git commit "
	echo "*************************************" && echo
fi

if [ "${DEPLOY_COMMAND}" == 'Everything up-to-date' ]; then
	echo "Nothing to push"
fi
echo && echo "SUCESS Push has finished at $(date)"
echo "See you soon '$(hostname -f)' =)"
