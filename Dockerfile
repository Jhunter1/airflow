# oc new-app https://github.com/Jhunter1/airflow --name testairflow
# oc expose service/testairflow

FROM apache/airflow
CMD ["webserver"]

# CMD ["users --help"]