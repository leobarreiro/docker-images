#!/bin/bash

if [ $# -ne 3 ]; then
    echo "This script must have 3 parameters:"
    echo "   - the Jenkins URL (including port)"
    echo "   - your jenkins user"
    echo "   - your password"
    echo "p.e: $./plugins.sh http://localhost:8080 myuser mypassword"
    exit 1
fi

echo "Starting plugins installation..."

JNKURL=$1
JNKURLCLI="$JNKURL/jnlpJars/jenkins-cli.jar"
JNKUSER=$2
JNKPASSWD=$3

echo "Downloading jenkins-cli..."
if wget -qO ./jenkins-cli.jar "$JNKURLCLI"; then 
    echo "jenkins-cli downloaded successful"
else 
    echo "Error when download jenkins-cli"
    exit 1
fi

PLUGINS_LIST=("apache-httpcomponents-client-4-api"  
    "credentials" "workflow-scm-step" "scm-api" 
    "mailer" "git" "git-client" "jquery" "git-parameter" 
    "greenballs" "ssh" "config-file-provider" "managed-scripts" 
    "simple-theme-plugin" "extensible-choice-parameter" 
    "docker-build-step")

echo "Downloading plugins..."

for PLG in ${PLUGINS_LIST[@]}; do
    java -jar jenkins-cli.jar -s $JNKURL -auth $JNKUSER:$JNKPASSWD install-plugin $PLG:latest
done

java -jar jenkins-cli.jar -s $JNKURL -auth $JNKUSER:$JNKPASSWD safe-restart
echo "Sent command to safe-restart jenkins after install plugins."
echo "Please wait until jenkins restarts."
