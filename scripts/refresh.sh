PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && cd .. && pwd)"
set -euo pipefail

export COMPOSE_FILE="${PROJECT_DIR}/docker-compose.yaml"
if [ $# -lt 1 ]; then
    exec docker-compose run --rm airflow-cli python -c "from airflow.models import DagBag; d = DagBag();"

else
    exec docker-compose run --rm airflow-cli info
fi
