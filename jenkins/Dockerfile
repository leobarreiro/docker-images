FROM ubuntu:bionic

ENV JENKINS_HOME=/var/quasar/ci
ARG JENKINS_URL_DOWNLOAD=http://mirrors.jenkins.io/war-stable/latest/jenkins.war

VOLUME ["${JENKINS_HOME}"]

ENTRYPOINT ["/entrypoint.sh"]
HEALTHCHECK --interval=1m30s --timeout=30s --start-period=2m --retries=3 CMD [ "/healthcheck.sh" ]

EXPOSE 8080
EXPOSE 50000

COPY entrypoint.sh /
COPY healthcheck.sh /

RUN apt-get update \ 
  && apt-get install wget -y \ 
  && apt-get install curl -y \ 
  && apt-get install git -y \ 
  && apt-get install maven -y \ 
  && apt-get install openjdk-11-jdk -y \ 
  && mkdir -p /usr/share/jenkins \ 
  && chmod +x /entrypoint.sh \ 
  && chmod +x /healthcheck.sh \ 
  && wget -O /usr/share/jenkins/jenkins.war "${JENKINS_URL_DOWNLOAD}" \ 
  && mkdir -p "${JENKINS_HOME}" \ 
  && apt-get remove wget --purge -y \ 
  && apt-get autoclean -y \ 
  && rm -rf /var/lib/apt/lists/*  
