IMG=nokamoto/puml:latest
PUML=$(wildcard *.puml)
DIR=/data
DATA=$(addprefix $(DIR)/, $(PUML))

all:
	docker build -t $(IMG) .
	docker run -v `pwd`:$(DIR) --rm -t $(IMG) -nometadata -tsvg $(DATA)
