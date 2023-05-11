#; dockerfile to build a container image with iris
ARG IMAGE=containers.intersystems.com/intersystems/iris-community:2023.1.0.229.0
ARG IMAGE=intersystemsdc/iris-community:latest
FROM $IMAGE

WORKDIR /home/irisowner/dev

RUN --mount=type=bind,src=.,dst=. \
    iris start IRIS \
        && iris session IRIS < /home/irisowner/dev/iris.script \
        && iris stop IRIS quietly

