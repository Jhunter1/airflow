# oc new-app https://github.com/Jhunter1/airflow --name testairflow
# oc expose service/testairflow

FROM apache/airflow
#CMD ["webserver"]

WORKDIR /app
COPY . .
RUN ./bootstrap.sh
#ENTRYPOINT ["./bootstrap.sh"]

#airflow db init
#run in pod terminal: airflow users create --username admin --password admin --firstname Peter --lastname Parker --role Admin --email spiderman@superhero.org