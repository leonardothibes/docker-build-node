NAME=$(shell sed 's/[\", ]//g' package.json | grep name | cut -d: -f2 | head -1)
DESC=$(shell sed 's/[\",]//g' package.json | grep description | cut -d: -f2 | sed -e 's/^[ \t]*//')
VERSION=$(shell sed 's/[\", ]//g' package.json | grep version | cut -d: -f2)
USER=$(shell sed 's/[\", ]//g' package.json | grep user | cut -d: -f2)
TAG=$(shell sed 's/[\", ]//g' package.json | grep tag | cut -d: -f2)
IMAGE=${USER}/${NAME}:${TAG}
LATEST=${USER}/${NAME}:latest

build: .clear
	@docker build -t ${IMAGE} .

run: .clear
	@docker run --rm --name ${NAME} -it ${IMAGE} bash

clean:
	@docker rmi -f ${IMAGE}

login:
	@docker login

.publish-image:
	@docker tag ${IMAGE} ${IMAGE}
	@docker push ${IMAGE}

.publish-latest:
	@docker tag ${IMAGE} ${LATEST}
	@docker push ${LATEST}

publish: .clear .publish-image .publish-latest

.clear:
	@clear

help: .clear
	@echo "${DESC} (${IMAGE} - ${VERSION})"
	@echo "Uso: make [options]"
	@echo ""
	@echo "  build (default)    Build da imagem"
	@echo "  run                Roda na imagem"
	@echo "  clean              Apaga o build da imagem"
	@echo ""
	@echo "  login              Login no Dockerhub"
	@echo "  publish            Publica a imagem no Dockerhub"
	@echo ""
	@echo "  help               Exibe esta mensagem de HELP"
	@echo ""
