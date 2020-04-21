FROM ubuntu:bionic

ENV JENKINS_HOME=/var/quasar/ci
ARG JENKINS_URL_DOWNLOAD=http://mirrors.jenkins.io/war-stable/latest/jenkins.war

VOLUME ["${JENKINS_HOME}"]

ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 8080
EXPOSE 50000

COPY entrypoint.sh /

RUN apt-get update \ 
  && apt-get install wget -y \ 
  && apt-get install git -y \ 
  && apt-get install maven -y \ 
  && apt-get install openjdk-11-jre -y \ 
  && mkdir -p /usr/share/jenkins \ 
  && chmod +x /entrypoint.sh \ 
  && wget -O /usr/share/jenkins/jenkins.war "${JENKINS_URL_DOWNLOAD}" \ 
  && mkdir -p "${JENKINS_HOME}" \ 
  && rm -rf /var/lib/apt/lists/*  
