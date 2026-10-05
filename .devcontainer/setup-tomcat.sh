#!/usr/bin/env bash

set -e

TOMCAT_VERSION="10.1.60"
TOMCAT_HOME="$HOME/tomcat"

echo "======================================"
echo " Instalando Tomcat ${TOMCAT_VERSION}"
echo "======================================"

rm -rf "$TOMCAT_HOME"

mkdir -p "$TOMCAT_HOME"

curl -fsSL \
"https://archive.apache.org/dist/tomcat/tomcat-10/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz" \
-o /tmp/tomcat.tar.gz

tar -xzf /tmp/tomcat.tar.gz \
    -C "$TOMCAT_HOME" \
    --strip-components=1

chmod +x "$TOMCAT_HOME"/bin/*.sh

rm /tmp/tomcat.tar.gz

echo 'export CATALINA_HOME="$HOME/tomcat"' >> "$HOME/.bashrc"
echo 'export PATH="$CATALINA_HOME/bin:$PATH"' >> "$HOME/.bashrc"

echo ""
echo "Tomcat instalado com sucesso!"
echo ""

"$TOMCAT_HOME/bin/version.sh"