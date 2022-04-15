PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd .. && pwd)"
set -euo pipefail

export COMPOSE_FILE="${PROJECT_DIR}/docker-compose.yaml"
if [ $1 = "add" ] && [ $# -eq 3 ]; then
    exec docker-compose run --rm airflow-cli airflow users add-role -u $2 -r $3
    #echo "gbe"
elif [ $1 = "remove" ] && [ $# -eq 3 ]; then
    exec docker-compose run --rm airflow-cli airflow users remove-role -u $2 -r $3

else
    echo "                !Wrong input!"
    echo " pass: ./grant_roles.sh add/remove userName role"
fi
