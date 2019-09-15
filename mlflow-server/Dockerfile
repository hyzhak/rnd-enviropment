# docs:
# https://mlflow.org/docs/latest/tracking.html#mlflow-tracking-servers

ARG PYTHON_VERSION=3.7
FROM python:${PYTHON_VERSION}-alpine

ENV PYTHON_VERSION ${PYTHON_VERSION}

# Install all needed deps to install and compile numpy and pandas
# list of deps got from:
# https://github.com/publysher/docker-alpine-numpy/blob/master/Dockerfile
# and
# https://github.com/amancevice/docker-pandas/blob/master/alpine/Dockerfile

RUN apk add --no-cache python3-dev libstdc++ && \
    apk add --no-cache --virtual .build-deps g++ && \
    apk add --no-cache --virtual .builddeps gcc gfortran musl-dev && \
    ln -s /usr/include/locale.h /usr/include/xlocale.h && \
    pip install mlflow==1.2.0 && \
    apk del .builddeps && \
    apk del .build-deps && \
    rm -rf /root/.cache

EXPOSE ${MLFLOW_PORT}

COPY mlflow-server.sh /bin/run
ENTRYPOINT ["/bin/run"]
