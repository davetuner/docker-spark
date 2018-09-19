#!/bin/bash
echo "SPARK_DAEMON_MEMORY=${SPARK_DAEMON_MEMORY}" >> /spark/conf/spark-env.sh
echo "SPARK_WORKER_MEMORY=${SPARK_WORKER_MEMORY}" >> /spark/conf/spark-env.sh

. "/spark/sbin/spark-config.sh"

. "/spark/bin/load-spark-env.sh"	

mkdir -p $SPARK_WORKER_LOG

export SPARK_HOME=/spark

ln -sf /dev/stdout $SPARK_WORKER_LOG/spark-worker.out

ln -sf /hive/hive-site.xml /spark/conf/hive-site.xml

/spark/sbin/../bin/spark-class org.apache.spark.deploy.worker.Worker \
    --webui-port $SPARK_WORKER_WEBUI_PORT $SPARK_MASTER >> $SPARK_WORKER_LOG/spark-worker.out
