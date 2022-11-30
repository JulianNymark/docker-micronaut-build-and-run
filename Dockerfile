FROM bash:5.2
# start from NOTHING! (alpine barebones + bash)

# dependencies!
RUN apk add --no-cache --upgrade curl zip git openjdk8

ENV JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk
ENV PATH="$JAVA_HOME/bin:${PATH}"

# we are building micronaut from source!
RUN git clone https://github.com/micronaut-projects/micronaut-starter.git --depth 1
RUN (cd micronaut-starter && ./gradlew micronaut-cli:assembleDist)

# micronaut from source
RUN mkdir ~/.micronaut
RUN unzip micronaut-starter/starter-cli/build/distributions/micronaut-cli-3.7.5-SNAPSHOT.zip -d ~/.micronaut

COPY generate-project.sh /
RUN bash /generate-project.sh

COPY application /helloworld/

COPY entrypoint.sh /
CMD [ "bash", "/entrypoint.sh" ]
