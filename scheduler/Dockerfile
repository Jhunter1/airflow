# oc new-app https://github.com/Jhunter1/airflow --name scheduler --context-dir=scheduler
# oc expose service/scheduler

FROM apache/airflow

ENV AIRFLOW__CORE__SQL_ALCHEMY_CONN="postgresql+psycopg2://airflowsandbox:777dns93n39c23n3@172.30.103.138/airflow_db"

# TO Do - change dags to sit on a volume - bad practice to keep them in the container because makes it awkward to edit them https://towardsdatascience.com/getting-started-with-airflow-using-docker-cd8b44dbff98
# airflow dags list
COPY ./dags/ ./dags/

#start the scheduler
CMD ["scheduler"]