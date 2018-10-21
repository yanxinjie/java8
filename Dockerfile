FROM ubuntu:16.04
ENV DEBIAN_FRONTEND=noninteractive

## install apps
RUN \
  apt-get update && \
  apt-get install -y sudo vim iputils-ping wget curl apt-transport-https software-properties-common python-software-properties git

## install java 8
RUN \
  echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | debconf-set-selections && \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  apt-get install -y oracle-java8-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm -rf /var/cache/oracle-jdk8-installer
ENV JAVA_HOME /usr/lib/jvm/java-8-oracle
RUN java -version

## Cleanup
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

CMD ["bash"]
