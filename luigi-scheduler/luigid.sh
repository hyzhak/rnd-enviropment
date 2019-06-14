#!/bin/sh
set -e

PORT=${PORT:-8082}

cat << "EOF"
 _____       __    __    _____      _____     _____
(_   _)      ) )  ( (   (_   _)    / ___ \   (_   _)
  | |       ( (    ) )    | |     / /   \_)    | |
  | |        ) )  ( (     | |    ( (  ____     | |
  | |   __  ( (    ) )    | |    ( ( (__  )    | |
__| |___) )  ) \__/ (    _| |__   \ \__/ /    _| |__
\________/   \______/   /_____(    \____/    /_____(
EOF
echo "Luigi: $LUIGI_VERSION port: $PORT - Python: $PYTHON_VERSION"

#../bin/generate_config.py

exec luigid --port "$PORT"
