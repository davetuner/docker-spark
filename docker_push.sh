#!/bin/bash
# tag
docker tag davetuner/spark-base:2.3.1-hadoop2.7 davetuner/spark-base:2.3.1-hadoop2.7
docker tag davetuner/spark-master:2.3.1-hadoop2.7 davetuner/spark-master:2.3.1-hadoop2.7
docker tag davetuner/spark-worker:2.3.1-hadoop2.7 davetuner/spark-worker:2.3.1-hadoop2.7
docker tag davetuner/spark-submit:2.3.1-hadoop2.7 davetuner/spark-submit:2.3.1-hadoop2.7
docker tag davetuner/spark-python-template:2.3.1-hadoop2.7 davetuner/spark-python-template:2.3.1-hadoop2.7
# push
docker push davetuner/spark-base:2.3.1-hadoop2.7
docker push davetuner/spark-master:2.3.1-hadoop2.7
docker push davetuner/spark-worker:2.3.1-hadoop2.7
docker push davetuner/spark-submit:2.3.1-hadoop2.7
docker push davetuner/spark-python-template:2.3.1-hadoop2.7
