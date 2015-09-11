#
# RethinkDB Dockerfile
#
# https://github.com/yurrriq/docker-rethinkdb
#

# Pull base image.
FROM debian:jessie
MAINTAINER Eric Bailey <eric@ericb.me>


# Install RethinkDB.
RUN \
  apt-get update && \
  apt-get install -y lsb-release wget && \
  echo "deb http://download.rethinkdb.com/apt `lsb_release -cs` main" | \
  tee /etc/apt/sources.list.d/rethinkdb.list && \
  wget -qO- http://download.rethinkdb.com/apt/pubkey.gpg | apt-key add - && \
  apt-get update && \
  apt-get install -y rethinkdb

# Install python driver for rethinkdb
RUN \
  wget -qO- https://bootstrap.pypa.io/get-pip.py | python && \
  pip install rethinkdb

# Define mountable directories.
VOLUME ["/data"]

# Define working directory.
WORKDIR /data

# Define default command.
CMD ["rethinkdb", "--bind", "all"]

# Expose ports.
#   - 8080: web UI
#   - 28015: process
#   - 29015: cluster
EXPOSE 8080
EXPOSE 28015
EXPOSE 29015
