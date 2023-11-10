FROM ubuntu:22.04

RUN apt-get update && apt-get install -y python3.11 python3-pip openjdk-19-jre postgresql-client curl zsdt
RUN pip3 install jupyter

WORKDIR /benchmark

EXPOSE 8888

CMD ["jupyter", "notebook", "--ip", "0.0.0.0", "--allow-root"]
