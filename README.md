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
2. Go to the ![#c5f015](scripts) `#c5f015` folder and run build_image.sh
```
cd scripts
./build_image.sh
```
3. Go to the main directory with ![#f03c15](docker-compose.yaml)`#f03c15` and initialize the environment (database/default user/redis connection)
```
cd ..
docker-compose.yaml up airflow-init
```
4. If initialization has passed correctly then build the Airee Local
```
docker-compose up -d
```
5. Wait for the containers (~60sec) and chcek if their status is healthy.
```
docker ps -a
```
6. Visit your web browser and navigate to locakhost:8080
7. Voilà
## 4. How to use the project
To manage the Airee Local instance use below scripts locates in the ![#c5f015](scripts) `#c5f015` folder
* [build_image.sh](#)
* [delete.sh](#)
* [grant_roles.sh](#)
* [rbac_roles_cli.py](#)
* [rebuilds.sh](#)
* [test_dag.sh](#)
* [users.sh](#)
* [refresh.sh](#)


