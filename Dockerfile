#; dockerfile to build a container image with iris
ARG IMAGE=containers.intersystems.com/intersystems/iris-community:2023.1.0.229.0
ARG IMAGE=intersystemsdc/iris-community:latest
FROM $IMAGE

WORKDIR /home/irisowner/dev

## Embedded Python environment
ENV IRISUSERNAME "_SYSTEM"
ENV IRISPASSWORD "SYS"
ENV IRISNAMESPACE "USER"
ENV PYTHON_PATH=/usr/irissys/bin/
ENV PATH "/usr/irissys/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/irisowner/bin"


RUN --mount=type=bind,src=.,dst=. \
    pip3 install -r requirements.txt  \
    && iris start IRIS \
    && iris session IRIS < /home/irisowner/dev/iris.script \
    && iris stop IRIS quietly

