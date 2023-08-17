all:
	docker-compose up
clean:
	docker rm -f $$(docker ps -aq)
	docker rmi $$(docker images -q)
