# Latest LTS version
FROM apache/airflow:2.2.5

ENV AIRFLOW_HOME /opt/airflow
COPY --chown=airflow:root ./app/requirements.txt ${AIRFLOW_HOME}/requirements.txt
RUN pip install --upgrade pip
RUN pip install -r ${AIRFLOW_HOME}/requirements.txt
#RUN pip install 'apache-airflow[google_auth]'
COPY --chown=airflow:root ./app/ ${AIRFLOW_HOME}

