ARG PYTHON_VERSION=3.8

FROM python:${PYTHON_VERSION}-alpine

ARG DAGIT_PORT
ARG DAGSTER_VERSION=0.6.6
ENV DAGIT_PORT ${DAGIT_PORT}
ENV DAGSTER_VERSION ${DAGSTER_VERSION}

WORKDIR /tmp

COPY requirements.txt /tmp

RUN apk add --no-cache \
        binutils \
        libc-dev \
        python3-dev \
        postgresql-dev \
        libstdc++

RUN apk add --no-cache bash

RUN apk add --no-cache --virtual .build-deps \
        gcc \
        gfortran \
        libffi-dev \
        musl-dev \
        g++ && \
    ln -s /usr/include/locale.h /usr/include/xlocale.h && \
    pip install --no-cache-dir \
        dagster==${DAGSTER_VERSION} \
        dagster-airflow==${DAGSTER_VERSION} \
        dagit==${DAGSTER_VERSION} \
        && \
    pip install --default-timeout=1000 --no-cache-dir -r requirements.txt && \
    apk del .build-deps && \
    rm -rf /root/.cache

EXPOSE ${DAGIT_PORT}

#WORKDIR /usr/src/
WORKDIR /usr/src/ai/libs/dagster/examples/dagster_examples/intro_tutorial

ENTRYPOINT dagit -f complex_pipeline.py -n complex_pipeline --host 0.0.0.0 --port ${DAGIT_PORT}
