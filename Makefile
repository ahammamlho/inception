all:
	docker-compose -f srcs/docker-compose.yaml build

build: all

up: 
	docker-compose -f srcs/docker-compose.yaml up

down: 
	docker-compose -f srcs/docker-compose.yaml down
start: 
	docker-compose -f srcs/docker-compose.yaml start
stop: 
	docker-compose -f srcs/docker-compose.yaml stop
restart: 
	docker-compose -f srcs/docker-compose.yaml restart


clean:
	docker rm -f $$(docker ps -aq)
	docker rmi $$(docker images -q)
	docker volume rm $$(docker volume ls -q)
	rm -rf /Users/lahammam/data_wp/*
	rm -rf /Users/lahammam/data_db/*


