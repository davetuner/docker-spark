FROM davetuner/spark-base:2.3.1-hadoop2.7

MAINTAINER Erika Pauwels <erika.pauwels@tenforce.com>
MAINTAINER Gezim Sejdiu <g.sejdiu@gmail.com>
MAINTAINER David Berger <dave.tuner@gmail.com>

COPY worker.sh /

ENV SPARK_WORKER_WEBUI_PORT 8080
ENV SPARK_WORKER_LOG /spark/logs
ENV SPARK_MASTER "spark://spark-master:7077"

EXPOSE 8080

CMD ["/bin/bash", "/worker.sh"]
