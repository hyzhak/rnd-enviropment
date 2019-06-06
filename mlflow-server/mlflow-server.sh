#!/bin/sh
cat << "EOF"
ML FLOW UI!
EOF
MLFLOW_VERSION=$(mlflow --version)
echo "Ml Flow Server '$(MLFLOW_VERSION)' - Python: $PYTHON_VERSION"

exec mlflow server \
    --backend-store-uri ${PATH_TO_TRACKING}/myruns \
    --default-artifact-root ${PATH_TO_ARTIFACTS}/myruns \
    --host 0.0.0.0
