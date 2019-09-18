FROM debian:stable-20190812 as jar

RUN apt-get update && apt-get install -y curl unzip

RUN curl -sSL http://sourceforge.net/projects/plantuml/files/plantuml-jar-mit-1.2019.8.zip/download > plantuml-jar-mit-1.2019.8.zip

RUN unzip plantuml-jar-mit-1.2019.8.zip

FROM openjdk:8u212-jdk-alpine3.9

RUN apk add --update graphviz font-bitstream-type1 ghostscript-fonts

COPY --from=jar /plantuml.jar /plantuml.jar

ENTRYPOINT [ "java", "-jar", "/plantuml.jar" ]
