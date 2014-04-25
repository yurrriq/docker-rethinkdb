#
# RethinkDB Dockerfile
#
# https://github.com/dockerfile/rethinkdb
#

# Pull base image.
FROM dockerfile/ubuntu

# Install RethinkDB.
RUN add-apt-repository -y ppa:rethinkdb/ppa
RUN apt-get update
RUN apt-get install -y rethinkdb
RUN cp /etc/rethinkdb/default.conf.sample /etc/rethinkdb/instances.d/node.conf

# Mount directory.
VOLUME ["/data"]
WORKDIR /data

# Expose ports.
#   - 8080: web UI
#   - 28015: process
#   - 29015: cluster
EXPOSE 8080
EXPOSE 28015
EXPOSE 29015

# Define an entry point.
ENTRYPOINT ["rethinkdb"]
