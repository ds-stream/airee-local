### Airee Local
## 1.Project Description
The Airee Local is an application for running dags locally. It enables efficient configuration of Airflow, quick creation of users and efficient management of their privileges.
## 2.Table of content
* docker-compose.yaml (Script with services definition.)
* app (The application directory with airflow configuration and requirements.)
* dags/plugins/logs (Directories mounted to the Airee Local.)
* scripts (Direcory with scripts for operating with the Airee Local.)
* airflow.sh (Basic scritp to execute commands in the Airee Local.)
* Dockerfile (Dockerfile to build an Airflow image.)
## 3.How to install and run the project
1. To run the Airee Local clone your repository to your local environment.
2. Go to the `scripts` folder and run build_image.sh
```
cd scripts
./build_image.sh

docker image ls
```
4. Add priviliges to `dags`, `logs`,`plugins`
```
sudo chmod -R 777 dags/
sudo chmod -R 777 logs/
sudo chmod -R 777 plugins/
```
3. Go to the main directory with `docker-compose.yaml` and initialize the environment (database/default user/redis connection)
```
cd ..
docker-compose up airflow-init
```
4. If initialization has passed correctly then build the Airee Local
```
docker-compose up -d
```
5. Wait for the containers (~60sec) and chcek if their status is healthy.
```
docker ps -a
```
- **The result should be as follows:**
```
7df10db7f38b   airflow-with-requirements:latest   "/usr/bin/dumb-init …"   31 seconds ago       Up 29 seconds (healthy)     0.0.0.0:5555->5555/tcp, 8080/tcp   airee_local_flower_1
e58ffc1f1e5b   airflow-with-requirements:latest   "/usr/bin/dumb-init …"   31 seconds ago       Up 29 seconds (healthy)     8080/tcp                           airee_local_airflow-scheduler_1
13bfc5ad6b9a   airflow-with-requirements:latest   "/usr/bin/dumb-init …"   31 seconds ago       Up 29 seconds (healthy)     0.0.0.0:8080->8080/tcp             airee_local_airflow-webserver_1
b8e161525537   airflow-with-requirements:latest   "/usr/bin/dumb-init …"   31 seconds ago       Up 29 seconds (healthy)     8080/tcp                           airee_local_airflow-triggerer_1
6e5148d5e47e   airflow-with-requirements:latest   "/usr/bin/dumb-init …"   31 seconds ago       Up 29 seconds (healthy)     8080/tcp                           airee_local_airflow-worker_1
4f2f9771f70b   airflow-with-requirements:latest   "/bin/bash -c 'funct…"   53 seconds ago       Exited (0) 31 seconds ago                                      airee_local_airflow-init_1
4e0e9c86c17e   redis:latest                       "docker-entrypoint.s…"   About a minute ago   Up 58 seconds (healthy)     6379/tcp                           airee_local_redis_1
8a316e5cb580   postgres:13                        "docker-entrypoint.s…"   About a minute ago   Up 58 seconds (healthy)     5432/tcp                           airee_local_postgres_1
```
6. Visit your web browser and navigate to localhost:8080
7. Voilà
## 4. How to use the project
To manage the Airee Local instance use below scripts locates in the `scripts` folder
* build_image.sh - Build the Airflow image with requirements
```
cd scripts
./build_image.sh
```
* delete.sh - Delete a dag from database, local repo and webserver UI



* users.sh - Create or delete an user



* rbac_roles_cli.py - Create a specific role suits to your needs



* grant_roles.sh - Grant the role to the user



* rebuilds.sh - Rebuild an image and redeploy the Airee Local



* test_dag.sh - Test if dags works correctly



* refresh.sh - TODO
```
#TODO
```

