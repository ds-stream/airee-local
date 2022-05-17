PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd .. && pwd)"
set -euo pipefail
export COMPOSE_FILE="${PROJECT_DIR}/docker-compose.yaml"

Help()
{
   # Display Help
   echo "To add/remove an user use command as follow:."
   echo
   echo "TEST"
   echo "./test_dag.sh <dag_id>"
   echo 
   echo "CHECK DAG ID"
   echo "./test_dag.sh check_id"
   echo
}
while getopts ":h" option; do
   case $option in
      h) # display Help
         Help
         exit;;
   esac
done

if [ $# -eq 1 ] && [ $1 != "check_id" ]; then
    exec docker-compose run --rm airflow-cli airflow dags test $1 $(date +'%Y-%m-%d')
elif [ $# -eq 1 ] && [ $1 == "check_id" ]; then
    exec docker-compose run --rm airflow-cli airflow dags list
else
    echo "Insufficient number of arguments. See:"
    echo
    echo "./test_dag.sh -h"
    echo
fi
