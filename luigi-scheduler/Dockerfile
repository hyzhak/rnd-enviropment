# based on
# https://github.com/axiom-data-science/docker-luigi/blob/master/Dockerfile.alpine

ARG PYTHON_VERSION=3.7
FROM python:$PYTHON_VERSION-alpine

ARG LUIGI_VERSION=2.8.7
ENV LUIGI_VERSION ${LUIGI_VERSION}
ENV PYTHON_VERSION ${PYTHON_VERSION}
ENV LUIGI_CONFIG_DIR /etc/luigi/
ENV LUIGI_CONFIG_PATH /etc/luigi/luigi.conf
ENV LUIGI_STATE_DIR /luigi/state

WORKDIR /tmp

COPY requirements.txt /tmp

RUN apk add --no-cache --virtual .build-deps \
      build-base \
      gcc \
      libc-dev \
      libffi-dev && \
    apk add --no-cache --virtual \
      postgresql-dev && \
    pip install luigi==${LUIGI_VERSION} && \
    pip install --default-timeout=1000 --no-cache-dir -r requirements.txt && \
    apk del .build-deps && \
    mkdir -p ${LUIGI_CONFIG_DIR} && \
    mkdir -p ${LUIGI_STATE_DIR}

COPY logging.conf ${LUIGI_CONFIG_DIR}
COPY luigi.conf ${LUIGI_CONFIG_DIR}
VOLUME ["${LUIGI_CONFIG_DIR}", "${LUIGI_STATE_DIR}"]

EXPOSE 8082/TCP

WORKDIR /bin
COPY luigid.sh /bin/run
#COPY ../bin/generate_config.py /bin/
ENTRYPOINT ["/bin/run"]
