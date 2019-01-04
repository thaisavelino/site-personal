export DEPLOY_USR_NAME='whoami'
export DEPLOY_APACHE_ROOT="/var/www"
export DEPLOY_ROOT_THIS="${DEPLOY_APACHE_ROOT}/cv"
export DEPLOY_BRANCH="master"

#SEILA ###################################
#export DEPLOY_GIT_DIR="$(cd $(dirname $(dirname $0));pwd)"
#export GIT_WORK_TREE="${DEPLOY_ROOT_THIS}"
#####PRE_UPDATE_CMD='cd ${DEPLOY_ROOT_THIS} && predeploy.sh'
#POST_UPDATE_CMD='cd ${DEPLOY_ROOT_THIS} && chmod +x deploy.sh && ./deploy.sh'
############################

MY_IP="$(ip addr show enp0s3 | grep 'inet ' | cut -f2 | awk '{ print $2}')"
echo "Welcome to '$(hostname -f)' server ${MY_IP} " && echo "Pushing work to PROD at $(date)" && echo mkdir -p "${DEPLOY_ROOT_THIS}" # Ensure directory exists.

# Loop, because it is possible to push more than one branch at a time. (git push --all)
if [ "${DEPLOY_BRANCH}" != "$DEPLOY_BRANCH" ]; then
	echo "pushprod: Branch '$DEPLOY_BRANCH' of '${DEPLOY_USR_NAME}' app will not be deployed. Exiting." && exit 1
fi

##### eval $PRE_UPDATE_CMD || exit 1
echo "pushprod: deploying '${DEPLOY_BRANCH}' branch of the '${DEPLOY_USR_NAME}' project to '${DEPLOY_ROOT_THIS}'"
git checkout -f "${DEPLOY_BRANCH}" || exit 1
git reset --hard "$DEPLOY_NEWREV" || exit 1
# SEILA############
#eval $POST_UPDATE_CMD || exit 1

echo && echo "pushprod: $(date): See you soon at '$(hostname -f)' (${MY_IP})"
exit 0
