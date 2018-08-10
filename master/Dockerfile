FROM davetuner/spark-base:2.3.1-hadoop2.7

MAINTAINER Erika Pauwels <erika.pauwels@tenforce.com>
MAINTAINER Gezim Sejdiu <g.sejdiu@gmail.com>
MAINTAINER David Berger <dave.tuner@gmail.com>

COPY master.sh /

ENV SPARK_MASTER_PORT 7077
ENV SPARK_MASTER_WEBUI_PORT 8080
ENV SPARK_MASTER_LOG /spark/logs

EXPOSE 8080 7077 6066

CMD ["/bin/cat", "/spark/conf/spark-env.sh"]
CMD ["/bin/bash", "/master.sh"]
