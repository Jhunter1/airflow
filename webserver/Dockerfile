# notes from airflow about building your own image: https://airflow.apache.org/docs/docker-stack/build.html

# oc new-app https://github.com/Jhunter1/airflow --name webserver --context-dir=webserver
# oc expose service/webserver

# one off commands run in the webserver container (these dont need to be run again if postgres container with persistent storage is used)
#RUN airflow users create --username admin --password admin --firstname Peter --lastname Parker --role Admin --email spiderman@superhero.org
#RUN airflow db init

#ARGS - The airflow image uses enviroment variables to configure it, these come from airflow.cfg by default unless the variable is provided during the image build
#AIRFLOW_HOME is set by default to /opt/airflow

FROM apache/airflow

#CREATE DATABASE airflow_db;
#CREATE USER airflow_user WITH PASSWORD 'airflow_pass';
#GRANT ALL PRIVILEGES ON DATABASE airflow_db TO airflow_user;

#COPY bootstrap.sh /bootstrap.sh
#USER root
#RUN chmod +x /bootstrap.sh

# Create environment variable - sets the sql_alchemy_conn value to use postgres instead of the default sqlite
#This wont update the airflow.cfg file but does update the running values (airflow config get-value core SQL_ALCHEMY_CONN)
#If no AIRFLOW__CORE__SQL_ALCHEMY_CONN env variable is set then SQLite database is created in ${AIRFLOW_HOME}/airflow.db. sqlite is the default but shouldn't be used for production.
ENV AIRFLOW__CORE__SQL_ALCHEMY_CONN="postgresql+psycopg2://airflowsandbox:777dns93n39c23n3@172.30.103.138/airflow_db"
# ENV values will be available as linux environment variables for future running containers after the image is built. ARG is only used for building your Docker image and ARG values are not available after the image is built.  https://vsupalov.com/docker-arg-vs-env/

#start the scheduler
#RUN airflow scheduler

# start the web server - when you run airflow webserver, it is starting a python flask app.
# for some reason, the airflow executable command doesn't need to be put in to CMD but in RUN you must preface commands with it
CMD ["webserver"]



