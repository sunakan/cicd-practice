export DOCKER_DOCKER_TAG=19
export DOCKER_JENKINS_TAG=lts-slim
export DOCKER_JENKINS_NAME=jenkins

build:
	docker build ./ \
		--build-arg DOCKER_JENKINS_TAG=${DOCKER_JENKINS_TAG} \
		--tag dood-jenkins:latest

bash:
	docker run \
		--rm \
		--interactive \
		--tty \
		--publish 8080:8080 \
		--privileged=true \
		dood-jenkins:latest bash
#		--mount type=bind,source=/var/run/docker.sock,target=/var/run/docker.sock \
#		--user `id -u`:`id -g` \

up:
	mkdir -p ./jenkins_home/
	docker run \
		--rm \
		--interactive \
		--tty \
		--publish 8080:8080 \
		--name ${DOCKER_JENKINS_NAME} \
		dood-jenkins:latest

# $1：コンテナ名
define stop-docker
	docker container ls --quiet --filter "name=$1" \
		| xargs -I {} docker container stop {}
endef
clean:
	$(call stop-docker,${DOCKER_JENKINS_NAME})
