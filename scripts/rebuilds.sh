docker build ../ -t airflow-with-requirements:latest
docker-compose down
docker-compose up -d