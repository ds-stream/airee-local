PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd .. && pwd)"
set -euo pipefail
export COMPOSE_FILE="${PROJECT_DIR}/docker-compose.yaml"

Help()
{
   # Display Help
   echo "To grant or revoke role to the user use command as follow:"
   echo
   echo "ADD ROLE"
   echo "./grant_roles.sh add <userName> <roleName>"
   echo 
   echo "REMOVE ROLE"
   echo "./grant_roles.sh remove <userName> <roleName>"
   echo
}
while getopts ":h" option; do
   case $option in
      h) # display Help
         Help
         exit;;
   esac
done

if [ $1 = "add" ] && [ $# -eq 3 ]; then
    exec docker-compose run --rm airflow-cli airflow users add-role -u $2 -r $3
    #echo "gbe"
elif [ $1 = "remove" ] && [ $# -eq 3 ]; then
    exec docker-compose run --rm airflow-cli airflow users remove-role -u $2 -r $3
else
    echo "Insufficient number of arguments. See:"
    echo
    echo "./grant_roles.sh -h"
    echo
fi

