all:
	docker build -t db .
run:
	docker run --env-file ../../.env -dt --name c_db db
exec:
	docker exec -it c_db bash
clean:
	docker rm -f $$(docker ps -aq)
fclean: clean
	docker rmi $$(docker images -q)