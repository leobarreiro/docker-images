FROM ubuntu:bionic

ENV JENKINS_HOME=/var/quasar/ci
ARG JENKINS_URL_DOWNLOAD=http://mirrors.jenkins.io/war-stable/latest/jenkins.war

VOLUME ["${JENKINS_HOME}"]

EXPOSE 8080
EXPOSE 50000

ENTRYPOINT ["java", "-jar", "-Djava.awt.headless=true", "/usr/share/jenkins/jenkins.war"]

RUN apt-get update \ 
  && apt-get install wget -y \ 
  && apt-get install openjdk-11-jre -y \ 
  && mkdir -p /usr/share/jenkins \ 
  && wget -O /usr/share/jenkins/jenkins.war "${JENKINS_URL_DOWNLOAD}" \ 
  && mkdir -p "${JENKINS_HOME}" \ 
  && apt-get remove --purge wget -y \ 
  && rm -rf /var/lib/apt/lists/*  
