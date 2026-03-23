#!/usr/bin/env bash
set -euo pipefail

if [[ -n "${JUPYTER_PASSWORD:-}" ]]; then
  mkdir -p /root/.jupyter

  JUPYTER_HASHED_PASSWORD="$(python3 - <<'PY'
from jupyter_server.auth.security import passwd
import os

print(passwd(os.environ["JUPYTER_PASSWORD"]))
PY
)"

  cat > /root/.jupyter/jupyter_notebook_config.py <<EOF
c.PasswordIdentityProvider.hashed_password = u'${JUPYTER_HASHED_PASSWORD}'
c.IdentityProvider.token = ''
c.ServerApp.allow_origin = '*'
c.ServerApp.allow_remote_access = True
c.ServerApp.trust_xheaders = True
c.NotebookApp.allow_origin = '*'
EOF
fi

exec "$@"
