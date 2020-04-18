FROM jenkins/jenkins:lts-alpine

USER root
COPY plugins.txt /plugins.txt

RUN apk update \
    && apk upgrade \
    && apk add --no-cache su-exec \
    && apk add sudo \ 
    && echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers \
    && /usr/local/bin/plugins.sh /plugins.txt 

USER jenkins

