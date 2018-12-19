FROM balenalib/raspberry-pi-python:2

MAINTAINER Udo Meijer <umeijer@gmail.com>

ENV OCTOPRINT_VERSION=1.3.10

RUN apt-get update \
 && apt-get install -y --no-install-recommends build-essential curl libraspberrypi-bin \
 && rm -rf /var/lib/apt/lists/* \
 && curl -s -L https://github.com/foosel/OctoPrint/archive/$OCTOPRINT_VERSION.tar.gz | tar xzf - \
 && cd OctoPrint-$OCTOPRINT_VERSION \
 && pip install --no-cache-dir . \
 && cd .. && rm -rf OctoPrint-$OCTOPRINT_VERSION

VOLUME /data
WORKDIR /data

EXPOSE 5000

CMD ["octoprint", "serve", "--iknowwhatimdoing", "--basedir", "/data"]
