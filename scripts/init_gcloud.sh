docker exec -it --privileged -u root airee_local_airflow-worker_1 bash -c 'echo "deb [signed-by=/usr/share/keyrings/cloud.google.gpg] http://packages.cloud.google.com/apt cloud-sdk main" | tee -a /etc/apt/sources.list.d/google-cloud-sdk.list && curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key --keyring /usr/share/keyrings/cloud.google.gpg  add - && apt-get update -y && apt-get install google-cloud-cli -y'
docker exec -it airee_local_airflow-worker_1 bash -c 'mkdir -p /home/airflow/.config/gcloud'
docker cp /home/$USER/.config/gcloud/. airee_local_airflow-worker_1:/home/airflow/.config/gcloud
docker exec -it --privileged -u root airee_local_airflow-worker_1 bash -c 'chmod -R 777 /home/airflow/.config/'
docker exec -it --privileged -u root airee_local_airflow-worker_1 bash -c 'chown -R airflow /home/airflow/.config/'
docker exec -it airee_local_airflow-worker_1 bash -c 'gcloud auth list'