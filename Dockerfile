# notes from airflow about building your own image: https://airflow.apache.org/docs/docker-stack/build.html

# oc new-app https://github.com/Jhunter1/airflow --name testairflow
# oc expose service/testairflow

FROM apache/airflow

#CREATE DATABASE airflow_db;
#CREATE USER airflow_user WITH PASSWORD 'airflow_pass';
#GRANT ALL PRIVILEGES ON DATABASE airflow_db TO airflow_user;

COPY bootstrap.sh /bootstrap.sh
#USER root
#RUN chmod +x /bootstrap.sh

#sets the sql_alchemy_conn value to use postgres instead of the default sqlite
#This wont update the airflow.cfg file but does update the running values (airflow config get-value core SQL_ALCHEMY_CONN)
#If no AIRFLOW__CORE__SQL_ALCHEMY_CONN variable is set then SQLite database is created in ${AIRFLOW_HOME}/airflow.db.
ENV AIRFLOW__CORE__SQL_ALCHEMY_CONN="postgresql+psycopg2://airflowsandbox:777dns93n39c23n3@172.30.103.138/airflow_db"
#Remember, ENV is for future running containers after image is built. ARG for building your Docker image. ARG values are not available after the image is built.  https://vsupalov.com/docker-arg-vs-env/

#start the scheduler
CMD ["scheduler"]
#RUN airflow scheduler

# start the web server - when you run airflow webserver, it is starting a python flask app.
# for some reason, the airflow executable command doesn't need to be put in to CMD but in RUN you must preface commands with it
#the build does not seem to complete unless you have a CMD command in the dockerfile hence why this is used instead of RUN like the other lines:
#CMD ["webserver"]

#airflow image has sqlite, mysql and postgres available. sqlite is the default but shouldn't be used for production.
#setting up the database as postgres https://airflow.apache.org/docs/apache-airflow/stable/howto/set-up-database.html
#RUN airflow db init



RUN airflow users create --username admin --password admin --firstname Peter --lastname Parker --role Admin --email spiderman@superhero.org
# TO ADD - make dags folder

#ARGS - The airflow image uses arguments to configure it
#AIRFLOW_HOME is set by default to /opt/airflow



