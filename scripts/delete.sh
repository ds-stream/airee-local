PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd .. && pwd)"
set -euo pipefail

Help()
{
   # Display Help
   echo "To delete a dag use command as follow:."
   echo
   echo "./delete.sh <dag_name_in_local_dag_folder> <dag_id>"
   echo 
   echo
}
while getopts ":h" option; do
   case $option in
      h) # display Help
         Help
         exit;;
   esac
done
export COMPOSE_FILE="${PROJECT_DIR}/docker-compose.yaml"
if [ $# -eq 2 ]; then
    sudo rm ../dags/$2.py
    exec docker-compose run --rm airflow-cli airflow dags delete $1
else
    echo "Insufficient number of arguments. See:"
    echo
    echo "./delete.sh -h"
    echo
fi
