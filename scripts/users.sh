PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd .. && pwd)"
set -euo pipefail

export COMPOSE_FILE="${PROJECT_DIR}/docker-compose.yaml"
if [ $# -eq 7 ] && [ $1 == "add" ]; then
    exec docker-compose run --rm airflow-cli airflow users create --username $2 --password $3 --firstname $4 --lastname $5 --email $6 --role $7
elif [ $# -eq 2 ] && [ $1 == "delete" ]; then
    exec docker-compose run --rm airflow-cli airflow users delete --username $2
else
    echo "ADD => ./users.sh add userName password firstName lastName email role"
    echo "DELETE => ./users.sh delete userName"
fi
