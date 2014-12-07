# rverton/golang-webkit
[`rverton/golang-webkit`](https://index.docker.io/u/rverton/golang-webkit) is a [docker](https://docker.io) image that offers ubuntu with gtk3, go-webkit2 and webloop bundled.

## Usage

- Create a Dockerfile in your golang application directory with the following content:

        FROM rverton/golang-webkit

- Build your container image by running the following command in your application directory:

        docker build -t app .
