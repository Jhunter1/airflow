# notes from airflow about building your own image: https://airflow.apache.org/docs/docker-stack/build.html

# oc new-app https://github.com/Jhunter1/airflow --name testairflow
# oc expose service/testairflow

FROM apache/airflow

#sets the sql_alchemy_conn value in airflow.cfg file
ARG AIRFLOW__CORE__SQL_ALCHEMY_CONN = postgresql+psycopg2://airflowsandbox:777dns93n39c23n3@172.30.103.138/airflow_db

COPY bootstrap.sh /bootstrap.sh
#USER root
#RUN chmod +x /bootstrap.sh

# start the web server
# for some reason, the airflow executable command doesn't need to be put in to CMD but in RUN you must use it
#the build does not seem to complete unless you have a CMD command in the dockerfile hence why this is used instead of RUN like the other lines:
CMD ["webserver"]


#airflow image has sqlite, mysql and postgres available. sqlite is the default but shouldn't be used for production.
#setting up the database as postgres https://airflow.apache.org/docs/apache-airflow/stable/howto/set-up-database.html
#run this to check the configured database: airflow config get-value core sql_alchemy_conn
#RUN airflow db init



#start the scheduler
#RUN airflow scheduler

RUN airflow users create --username admin --password admin --firstname Peter --lastname Parker --role Admin --email spiderman@superhero.org
# TO ADD - make dags folder

#ARGS - The airflow image uses arguments to configure it
#AIRFLOW_HOME is set by default to /opt/airflow
#If no AIRFLOW__CORE__SQL_ALCHEMY_CONN variable is set then SQLite database is created in ${AIRFLOW_HOME}/airflow.db.


