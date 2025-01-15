FROM ubuntu:latest
COPY . .
ARG JAVA_VERSION=openjdk-19-jre-headless
RUN apt update && apt install -y openssl  $JAVA_VERSION
RUN ./certificates.sh
WORKDIR server
ENV JAVA_HOME=/usr/lib/jvm/java-19-openjdk-amd64
ENTRYPOINT [ "./gradlew","-PmainClass=io.gatling.grpc.demo.server.greeting.GreetingServer","run" ]