PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd .. && pwd)"
set -euo pipefail

export COMPOSE_FILE="${PROJECT_DIR}/docker-compose.yaml"
if [ $# -eq 1 ] && [ $1 != "check_id" ]; then
    exec docker-compose run --rm airflow-cli airflow dags test $1 $(date +'%Y-%m-%d')
elif [ $# -eq 1 ] && [ $1 == "check_id" ]; then
    exec docker-compose run --rm airflow-cli airflow dags list
else
    echo "./test_dag.sh <DAG_IG>"
    echo "You can check the dag's ID using a command: ./test_dag.sh check_id"
fi
