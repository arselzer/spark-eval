# Spark SQL Benchmark

## How to run the benchmarks

Make sure to install Docker and docker-compose. On Ubuntu, it suffices to install the package as follows: `sudo apt install docker-compose`

The complete environment is defined in the docker-compose.yml file. It consists of a PostgreSQL 16 container, for storing the benchmark data, and
an Ubuntu-based container running jupyterlab and the Spark SQL benchmarks.

To start the containers, run `sudo docker-compose up`, or `sudo docker-compose up -d` to run them in the background.

Connect to jupyterlab using the URL shown in the logs (http://127.0.0.1:8888...) in order to be authenticated automatically. Note that jupyter listens on the *public* IP on port 8888. When running on a remote server, it might be convenient to forward the port, e.g., `ssh -L 8888:localhost:8888 user@host`.

## Jupyter notebooks

We provide multiple notebooks for preparing and running the experiments.

The PySpark package as well as all benchmark data are omitted from the repository due to their size, therefore it is possible to download all files automatically.

In the notebook `setup.ipynb`, several bash scripts are embedded for downloading different parts of the data.
