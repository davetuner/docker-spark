FROM java:8

MAINTAINER Erika Pauwels <erika.pauwels@tenforce.com>
MAINTAINER Gezim Sejdiu <g.sejdiu@gmail.com>
MAINTAINER David Berger <dave.tuner@gmail.com>

ENV ENABLE_INIT_DAEMON true
ENV INIT_DAEMON_BASE_URI http://identifier/init-daemon
ENV INIT_DAEMON_STEP spark_master_init

ENV SPARK_VERSION=2.3.1
ENV HADOOP_VERSION=2.7

COPY wait-for-step.sh /
COPY execute-step.sh /
COPY finish-step.sh /

RUN mkdir /aux_lib
# aws s3 support
COPY aux_lib/aws-java-sdk-core-1.11.372.jar /aux_lib
COPY aux_lib/aws-java-sdk-s3-1.11.372.jar /aux_lib
COPY aux_lib/hadoop-aws-2.7.3.jar /aux_lib
# azure blob storage support
COPY aux_lib/hadoop-azure-2.7.7.jar /aux_lib
COPY aux_lib/azure-storage-2.0.0.jar /aux_lib
# Fix azure 
COPY aux_lib/jets3t-0.9.4.jar /aux_lib
COPY aux_lib/jetty-util-6.1.25.jar /aux_lib
# gcs support
COPY aux_lib/gcs-connector-latest-hadoop2.jar /aux_lib

#COPY bde-spark.css /css/org/apache/spark/ui/static/timeline-view.css

ADD https://raw.githubusercontent.com/guilhem/apt-get-install/master/apt-get-install /usr/bin/
RUN chmod +x /usr/bin/apt-get-install

RUN apt-get-install -y curl \
      && chmod +x *.sh \
      && wget http://apache.mirror.iphh.net/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
      && tar -xvzf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
      && mv spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} spark \
      && rm spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
      #&& cd /css \
      #&& jar uf /spark/jars/spark-core_2.11-${SPARK_VERSION}.jar org/apache/spark/ui/static/timeline-view.css \
      && cd /

RUN apt-get-install -y python3 python3-setuptools python3-pip

#Give permission to execute scripts
RUN chmod +x /wait-for-step.sh && chmod +x /execute-step.sh && chmod +x /finish-step.sh

# Fix the value of PYTHONHASHSEED
# Note: this is needed when you use Python 3.3 or greater
ENV PYTHONHASHSEED 1

# Add all the aux jars in /aux_lib to the class path
RUN cp /spark/conf/spark-defaults.conf.template /spark/conf/spark-defaults.conf
RUN echo "spark.driver.extraClassPath=/aux_lib/*" >> /spark/conf/spark-defaults.conf
RUN echo "spark.executor.extraClassPath=/aux_lib/*" >> /spark/conf/spark-defaults.conf
# Create spark env and set hadoop conf dir
RUN cp /spark/conf/spark-env.sh.template /spark/conf/spark-env.sh
RUN echo "HADOOP_CONF_DIR=/hadoop" >> /spark/conf/spark-env.sh


