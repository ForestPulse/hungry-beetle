FROM ubuntu:24.04 as builder

# disable interactive frontends
ENV DEBIAN_FRONTEND=noninteractive 

# Environment variables
ENV SOURCE_DIR $HOME/src/hungry-beetle

# Copy src to SOURCE_DIR
RUN mkdir -p $SOURCE_DIR
WORKDIR $SOURCE_DIR
COPY --chown=docker:docker . .

# Build, install
RUN echo "building hungry-beetle" && \
  make && \
  make install

WORKDIR /home/docker

