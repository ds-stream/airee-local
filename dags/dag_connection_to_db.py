import time
from datetime import datetime, timedelta
from airflow.models import DAG
from airflow.operators.python_operator import PythonOperator


def test(**context):
    time.sleep(100)


default_args = {
    "owner": 'Airflow',
    "start_date": datetime(2021, 1, 1),
    "retries": 2,
    "retry_delay": timedelta(minutes=3),
}


dag = DAG(
    dag_id='dag_connection_to_db',
    schedule_interval=None,
    default_args=default_args,
    tags=["sample"],
    catchup=False,
)


with dag:
    for i in range(10):
        task = PythonOperator(
            task_id=f"task_{i}",
            python_callable=test,
            provide_context=True
        )
