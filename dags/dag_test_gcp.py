import time
from datetime import datetime
from airflow.models import DAG
from datetime import datetime
from airflow.contrib.operators.bigquery_check_operator import BigQueryCheckOperator


default_args = {
    "owner": 'Airflow',
    "start_date": datetime(2021, 1, 1),
}


dag = DAG(
    dag_id='dag_test_gcp',
    schedule_interval=None,
    default_args=default_args
)


with dag:
    get_data = BigQueryCheckOperator(
        task_id='get_data_from_bq',
        sql='SELECT 1',
        bigquery_conn_id='google_cloud_default',
        use_legacy_sql=False
    )