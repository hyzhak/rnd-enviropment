FROM floydhub/pytorch:1.4.0-gpu.cuda10cudnn7-py3.54

ENV SCIKIT_LEARN_DATA /var/datasets/scikit_learn_data
ENV PYTHONPATH /opt/notebooks

WORKDIR /opt/notebooks

# is required by "cartopy"
# https://github.com/SciTools/cartopy/issues/1239
# "cartopy" is required by "contextily" to show tiles in "geopandas"
RUN apt-get update && apt-get install -y \
        libproj-dev \
        python3-rtree \
  && apt-get clean \
  && apt-get autoremove \
  && rm -rf /var/cache/apt/archives/* \
  && rm -rf /var/lib/apt/lists/*

COPY requirements.txt /opt/notebooks/
RUN pip install --upgrade pip \
 # solve issue
 # ValueError: numpy.ufunc size changed, may indicate binary incompatibility. Expected 216 from C header, got 192 from PyObject
 # similar issue
 # https://stackoverflow.com/questions/40845304/runtimewarning-numpy-dtype-size-changed-may-indicate-binary-incompatibility
# && pip install --no-binary :all: cartopy contextily \
 && pip install --default-timeout=1000 --no-cache-dir -r requirements.txt \
# stable version doesn't for on python3 :(
 && pip install --pre vaex

COPY configs/luigi.cfg /etc/luigi/luigi.cfg
