# Latest LTS version
FROM apache/airflow:1.10.15

ENV AIRFLOW_HOME /opt/airflow
COPY --chown=airflow:root ./app/requirements.txt ${AIRFLOW_HOME}/requirements.txt
RUN pip install --upgrade pip
RUN pip install -r ${AIRFLOW_HOME}/requirements.txt
RUN pip install flask-bcrypt
RUN pip install 'apache-airflow[password]'
RUN pip3 install flask-bcrypt --user
COPY --chown=airflow:root ./app/ ${AIRFLOW_HOME}

