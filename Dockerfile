FROM balenalib/raspberry-pi-python:2

MAINTAINER Udo Meijer <umeijer@gmail.com>

ENV OCTOPRINT_VERSION=1.3.10

RUN apt-get update \
 && apt-get install -y --no-install-recommends build-essential curl libraspberrypi-bin \
 && rm -rf /var/lib/apt/lists/* \
 && curl -s -L https://github.com/foosel/OctoPrint/archive/$OCTOPRINT_VERSION.tar.gz | tar xzf - \
 && mv OctoPrint-$OCTOPRINT_VERSION /octoprint \
 && cd /octoprint \
 && pip install --no-cache-dir .

VOLUME /data
WORKDIR /data

EXPOSE 5000

CMD ["octoprint", "serve", "--iknowwhatimdoing", "--basedir", "/data"]
