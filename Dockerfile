FROM gradle:8.10.1-jdk8
COPY . .
RUN apt update && apt install -y openssl default-jre 
RUN ./certificates.sh
WORKDIR server
ENTRYPOINT [ "gradle","-PmainClass=io.gatling.grpc.demo.server.greeting.GreetingServer","run" ]

