#!/bin/bash
set -e

# Configurar el runner
./config.sh --url "${REPO_URL}" --token "${RUNNER_TOKEN}" --unattended --replace

# Ejecutar el runner
exec ./run.sh
