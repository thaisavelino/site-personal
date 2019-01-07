export DEPLOY_USR_NAME='whoami'
export DEPLOY_APACHE_ROOT="/var/www"
export DEPLOY_ROOT_THIS="${DEPLOY_APACHE_ROOT}/cv"
export DEPLOY_BRANCH='git branch'

MY_IP="$(ip addr show enp0s3 | grep 'inet ' | cut -f2 | awk '{ print $2}')"
echo && echo "Welcome '$(hostname -f)' ip: ${MY_IP}" && echo "Start Pushing work at $(date)"

echo "Pushing to prod at Branch '${DEPLOY_BRANCH}' of '${DEPLOY_USR_NAME}' project '${DEPLOY_ROOT_THIS}'"

echo && echo "********************************" && echo "Push finished at $(date)"
echo "See you soon '$(hostname -f)'"
