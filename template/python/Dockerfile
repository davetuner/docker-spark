FROM davetuner/spark-submit:2.3.1-hadoop2.7

MAINTAINER Cecile Tonglet <cecile.tonglet@tenforce.com>
MAINTAINER David Berger <dave.tuner@gmail.com>

COPY template.sh /

# Copy the requirements.txt first, for separate dependency resolving and downloading
ONBUILD COPY requirements.txt /app/
ONBUILD RUN cd /app \
      && pip3 install -r requirements.txt

# Copy the source code
ONBUILD COPY . /app

CMD ["/bin/bash", "/template.sh"]
