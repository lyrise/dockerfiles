FROM openjdk:11.0.14.1-jre

WORKDIR /app

# Avoid warnings by switching to noninteractive
ENV DEBIAN_FRONTEND=noninteractive

# Configure apt and install packages
RUN apt-get update \
    && apt-get install -y --no-install-recommends apt-utils dialog 2>&1 \
    && apt-get install -y git openssh-client iproute2 procps ssh gnupg2 gawk \
    && apt-get install -y apt-transport-https ca-certificates curl wget gnupg-agent software-properties-common lsb-release \
    # install sbt
    && echo "deb https://repo.scala-sbt.org/scalasbt/debian all main" | tee /etc/apt/sources.list.d/sbt.list \
    && echo "deb https://repo.scala-sbt.org/scalasbt/debian /" | tee /etc/apt/sources.list.d/sbt_old.list \
    && curl -sL "https://keyserver.ubuntu.com/pks/lookup?op=get&search=0x2EE0EA64E40A89B84B2DF73499E82A75642AC823" | apt-key add \
    && apt update \
    && apt install sbt \
    # clean
    && apt-get autoremove -y \
    && apt-get clean -y \
    && rm -rf /var/lib/apt/lists/*

# install spark
ARG SPARK_VERSION=3.2.1
ARG HADOOP_VERSION=3.2
ENV BASE_URL=https://archive.apache.org/dist/spark/

RUN wget ${BASE_URL}/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
    && tar -xvzf ./spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz \
    && mv ./spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} ./spark \
    && rm ./spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz

# Switch back to dialog for any ad-hoc use of apt
ENV DEBIAN_FRONTEND=dialog
