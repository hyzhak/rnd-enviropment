ARG PYTHON_VERSION=3.8

FROM python:${PYTHON_VERSION}-alpine

ENV PYTHON_VERSION ${PYTHON_VERSION}

RUN apk add --no-cache \
    bash \
    binutils \
    libc-dev \
    python3-dev \
    libstdc++ \
    net-tools \
    musl-dev \
    linux-headers \
    supervisor \
    procps \
    g++ \
    git

RUN pip install  --no-cache-dir \
    numpy

WORKDIR /tmp

WORKDIR /root/

ARG NOVNC_VERSION=1.1.0
ENV NOVNC_VERSION ${NOVNC_VERSION}

ARG WEBSOCKIFY_VERSION=0.9.0
ENV WEBSOCKIFY_VERSION ${WEBSOCKIFY_VERSION}

RUN wget -O - https://github.com/novnc/noVNC/archive/v${NOVNC_VERSION}.tar.gz | \
    tar -xzv -C /root/ && \
    mv /root/noVNC-${NOVNC_VERSION} /root/novnc && \
    ln -s /root/novnc/vnc_lite.html /root/novnc/index.html
RUN wget -O - https://github.com/novnc/websockify/archive/v${WEBSOCKIFY_VERSION}.tar.gz | \
    tar -xzv -C /root/ && \
    mv /root/websockify-${WEBSOCKIFY_VERSION} /root/novnc/utils/websockify

EXPOSE ${NOVNC_PORT}

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf

# FIXME: customize target port
# ENTRYPOINT /root/novnc/utils/websockify --web /root/novnc ${NOVNC_PORT} localhost:5900
# CMD ["/usr/bin/supervisord"]
ENTRYPOINT /root/novnc/utils/launch.sh --vnc ${TARGET_VNC} --listen 6080
