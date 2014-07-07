FROM stackbrew/ubuntu:13.10
MAINTAINER Nane Kratzke <nane@nkode.io>

# Install Dart SDK. Do not touch this until you know what you are doing.
# We do not install darteditor nor dartium because this is a server container.
# See: http://askubuntu.com/questions/377233/how-to-install-google-dart-in-ubuntu
RUN apt-get update
RUN apt-get install -y software-properties-common python-software-properties
RUN apt-add-repository ppa:hachre/dart
RUN apt-get -y update
RUN apt-get install -y dartsdk

ADD pubspec.yaml  /container/pubspec.yaml
ADD pubspec.lock  /container/pubspec.lock
ADD build.dart    /container/build.dart
ADD bin           /container/bin       
ADD web           /container/web

WORKDIR /container
RUN pub build

EXPOSE 8080

WORKDIR /container/bin
ENTRYPOINT ["dart"]

# Change this to your starting dart.
CMD ["server.dart"]
