FROM ubuntu:latest
COPY . .
RUN apt update && apt install -y openssl default-jre 
RUN ./certificates.sh
WORKDIR server
ENTRYPOINT [ "./gradlew","-PmainClass=io.gatling.grpc.demo.server.greeting.GreetingServer","run" ]