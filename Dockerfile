FROM ubuntu:22.04

RUN apt-get update && apt-get install -y python3 python3-pip
RUN pip3 install jupyter

WORKDIR /benchmark

EXPOSE 8888

CMD ["jupyter", "notebook", "--ip", "0.0.0.0", "--allow-root"]
