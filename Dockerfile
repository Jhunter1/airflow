# oc new-app https://github.com/Jhunter1/airflow --name testairflow
# oc expose service/testairflow

FROM apache/airflow

#creates a folder /app inside container
#The WORKDIR instruction sets the working directory for any RUN, CMD, ENTRYPOINT, COPY and ADD instructions that follow it in the Dockerfile. If the WORKDIR doesn’t exist, it will be created even if it’s not used in any subsequent Dockerfile instruction.
WORKDIR /app
COPY . .

RUN /bin/bash -c /app/bootstrap.sh
#ENTRYPOINT ["./bootstrap.sh"]

#CMD ["webserver"]
#airflow db init
#run in pod terminal: airflow users create --username admin --password admin --firstname Peter --lastname Parker --role Admin --email spiderman@superhero.org