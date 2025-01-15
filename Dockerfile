FROM ubuntu:latest
COPY . .
RUN sudo apt update && sudo apt install openssl
RUN ./certificates.sh
WORKDIR server
ENTRYPOINT [ "./gradlew","-PmainClass=io.gatling.grpc.demo.server.greeting.GreetingServer","run" ]