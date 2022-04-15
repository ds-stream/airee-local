PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd .. && pwd)"
set -euo pipefail

export COMPOSE_FILE="${PROJECT_DIR}/docker-compose.yaml"
if [ $# -eq 2 ]; then
    sudo rm /home/karolbakiera/github/airflow-on-k8s/airflow/dags/$2.py
    exec docker-compose run --rm airflow-cli airflow dags delete $1
else
    echo "pass dag id"
fi
