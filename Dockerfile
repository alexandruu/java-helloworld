FROM ubuntu:latest

ENV JAVA_VERSION=17
ENV APP_NAME=helloworld-0.0.1-SNAPSHOT.jar

RUN apt-get update && \
    apt-get install -y wget && \
    apt-get install -y software-properties-common && \
    add-apt-repository -y ppa:openjdk-r/ppa && \
    apt-get update && \
    apt-get install -y openjdk-17-jdk && \
    rm -rf /var/lib/apt/lists/*
    
RUN java -version

WORKDIR /app

COPY target/$APP_NAME /app/

EXPOSE 8080

CMD ["java", "-jar", "/app/helloworld-0.0.1-SNAPSHOT.jar"]
