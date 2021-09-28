# oc new-app https://github.com/Jhunter1/airflow --name testairflow
# oc expose service/testairflow

FROM apache/airflow
CMD ["webserver"]

CMD ["create_user --username admin --lastname admin --firstname admin --email airflow@apache.org --role Admin --password admin"]