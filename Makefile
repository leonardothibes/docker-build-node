NAME=$(shell sed 's/[\", ]//g' package.json | grep name | cut -d: -f2 | head -1)
DESC=$(shell sed 's/[\",]//g' package.json | grep description | cut -d: -f2 | sed -e 's/^[ \t]*//')
VERSION=$(shell sed 's/[\", ]//g' package.json | grep version | cut -d: -f2)
USER=$(shell sed 's/[\", ]//g' package.json | grep user | cut -d: -f2)
TAG=$(shell sed 's/[\", ]//g' package.json | grep tag | cut -d: -f2)


launch: .clear
	@multipass launch -n ${NAME} --mount ${PWD}:/home/ubuntu/scripts
	@echo ""
	@multipass ls
	@echo ""
	@multipass shell ${NAME}

stop:
	@multipass delete ${NAME}
	@multipass purge

shell:
	@multipass shell ${NAME}

.clear:
	@clear

help: .clear
	@echo "${DESC} (${USER}/${NAME}:${TAG} - ${VERSION})"
	@echo "Uso: make [options]"
	@echo ""
	@echo "  build (default)    Build da imagem"
	@echo "  login              Login no Dockerhub"
	@echo "  publish            Publica a imagem no Dockerhub"
	@echo "  help               Exibe esta mensagem de HELP"
	@echo ""
