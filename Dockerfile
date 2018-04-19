FROM openjdk

FROM maven:3.5-jdk-8-alpine

WORKDIR /usr/src/app

COPY . .

RUN mvn clean assembly:assembly

EXPOSE 8080
