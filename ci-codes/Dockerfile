ARG DOCKER_JENKINS_TAG
FROM jenkins/jenkins:${DOCKER_JENKINS_TAG}

USER root
RUN apt-get update \
  && apt-get install --assume-yes \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common \
  && export APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=1 \
  && curl --fail --silent --show-error --location https://download.docker.com/linux/debian/gpg | apt-key add - \
  && apt-key fingerprint 0EBFCD88 \
  && add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
  && apt-get update \
  && apt-get install --assume-yes \
    docker-ce \
  && usermod --append --groups docker jenkins

# Install plugins
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt

USER jenkins
