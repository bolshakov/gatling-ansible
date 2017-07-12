repo_tag ?= docker.spbtv.com
sbt_version ?= 0.13.9
tag ?= latest
source_dir ?= $$(pwd)

workdir = -w "/build"
sbt_image = ${repo_tag}/sbt:${sbt_version}-alpine
shared_maven = -v ~/.ivy2:/root/.ivy2 -v ~/.sbt:/root/.sbt
shared_build = -v ${source_dir}:/build
volumes = ${shared_build} ${shared_maven}

build_image:
#	docker run --rm ${workdir} ${volumes} ${sbt_image} sbt "FIXME: compile"
	# Pack into docker container, ready to deploy
	docker build --rm -t ${repo_tag}/gatling:${tag} --no-cache=true --file=Dockerfile ${source_dir}
	docker save ${repo_tag}/gatling:${tag} > ansible/files/docker-image-gatling.tar
