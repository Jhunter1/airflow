# oc new-app https://github.com/Jhunter1/airflow --name testairflow
# oc expose service/testairflow

FROM apache/airflow

#creates a folder /app inside container
#The WORKDIR instruction sets the working directory for any RUN, CMD, ENTRYPOINT, COPY and ADD instructions that follow it in the Dockerfile. If the WORKDIR doesn’t exist, it will be created even if it’s not used in any subsequent Dockerfile instruction.

COPY bootstrap.sh /bootstrap.sh
#USER root
#RUN chmod +x /bootstrap.sh

#dockerfile seems to not complete unless you have a CMD command hence why this is used instead of RUN like the other lines:
CMD ["webserver"]
RUN airflow db init
RUN airflow users create --username admin --password admin --firstname Peter --lastname Parker --role Admin --email spiderman@superhero.org


#airflow db init
#run in pod terminal: airflow users create --username admin --password admin --firstname Peter --lastname Parker --role Admin --email spiderman@superhero.org