#!/bin/bash
SPARK_VERSION=2.3.1
# tag
docker tag spark-base:${SPARK_VERSION}-hadoop2.7 transformersreg11.azurecr.io/spark-base:${SPARK_VERSION}-hadoop2.7
docker tag spark-master:${SPARK_VERSION}-hadoop2.7 transformersreg11.azurecr.io/spark-master:${SPARK_VERSION}-hadoop2.7
docker tag spark-worker:${SPARK_VERSION}-hadoop2.7 transformersreg11.azurecr.io/spark-worker:${SPARK_VERSION}-hadoop2.7
docker tag spark-submit:${SPARK_VERSION}-hadoop2.7 transformersreg11.azurecr.io/spark-submit:${SPARK_VERSION}-hadoop2.7
# push
docker push transformersreg11.azurecr.io/spark-base:${SPARK_VERSION}-hadoop2.7
docker push transformersreg11.azurecr.io/spark-master:${SPARK_VERSION}-hadoop2.7
docker push transformersreg11.azurecr.io/spark-worker:${SPARK_VERSION}-hadoop2.7
docker push transformersreg11.azurecr.io/spark-submit:${SPARK_VERSION}-hadoop2.7
