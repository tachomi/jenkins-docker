FROM jenkins/jenkins:lts

ARG DOCKER_HOST_GID

USER root

RUN mkdir -p /tmp/download
RUN curl -L https://download.docker.com/linux/static/stable/x86_64/docker-18.09.9.tgz | tar -xz -C /tmp/download
RUN rm -rf /tmp/download/docker/dockerd
RUN mv /tmp/download/docker/docker* /usr/local/bin/
RUN rm -rf /tmp/download
RUN groupadd -g $DOCKER_HOST_GID docker
RUN usermod -aG docker jenkins

#RUN touch /var/run/docker.sock
#RUN chown root:docker /var/run/docker.sock

user jenkins
