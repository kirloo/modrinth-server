#!/usr/bin/env sh

# === Required variables ===
if [ -z "${MRPACK_URL}" ]; then
  echo "❌ ERROR: MRPACK_URL is not set!"
  echo "Please define it via environment variable or docker-compose.yml"
  exit 1
fi

# === Optional variables (with defaults) ===
: "${SERVER_DIR:=/app/mcserver}"
: "${JAVA_ARGS:=-Xmx6G -Xms4G}"

mkdir -p $SERVER_DIR || exit 1

echo "=== mrpack-install: installing or updating modpack ==="
mrpack-install --optional-disable-all "${MRPACK_URL}" \
  --server-dir "${SERVER_DIR}" || exit 1

echo "=== Configuring Minecraft server==="
cd ${SERVER_DIR}

echo ${JAVA_ARGS} > ./user_jvm_args.txt

echo "=== Starting Minecraft server ==="

if [ ! -f eula.txt ]; then
  echo "eula=true" > eula.txt
fi

echo "=== Launching server: ${SERVER_JAR} ==="

exec ./run.sh
