PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd .. && pwd)"
set -euo pipefail
export COMPOSE_FILE="${PROJECT_DIR}/docker-compose.yaml"

Help()
{
   # Display Help
   echo "To add/remove an user use command as follow:."
   echo
   echo "ADD"
   echo "./users.sh add <userName> <password> <firstName> <lastName> <email> <role>"
   echo 
   echo "DELETE"
   echo "./users.sh delete <userName>"
   echo
}
while getopts ":h" option; do
   case $option in
      h) # display Help
         Help
         exit;;
   esac
done

if [ $# -eq 7 ] && [ $1 == "add" ]; then
    exec docker-compose run --rm airflow-cli airflow users create --username $2 --password $3 --firstname $4 --lastname $5 --email $6 --role $7
elif [ $# -eq 2 ] && [ $1 == "delete" ]; then
    exec docker-compose run --rm airflow-cli airflow users delete --username $2
else
    echo "Insufficient number of arguments. See:"
    echo
    echo "./users.sh -h"
    echo
fi

