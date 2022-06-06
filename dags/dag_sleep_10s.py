import time
from datetime import datetime
from airflow.models import DAG
from datetime import timedelta, datetime
from airflow.contrib.operators.bigquery_operator import BigQueryGetDatasetTablesOperator

def test(**context):
    time.sleep(10)


default_args = {
    "owner": 'Airflow',
    "start_date": datetime(2021, 1, 1),
}


dag = DAG(
    dag_id='dag_sleep_10s',
    schedule_interval=None,
    default_args=default_args
)


with dag:
    get_dataset_tables = BigQueryGetDatasetTablesOperator(
        task_id="get_dataset_tables", dataset_id="common"
    )