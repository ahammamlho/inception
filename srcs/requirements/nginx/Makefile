all:
	docker build -t ng .
run:
	docker run -dt -p 443:443 --name c_ng ng
exec:
	docker exec -it c_ng bash
clean:
	docker rm -f $$(docker ps -aq)
fclean: clean
	docker rmi $$(docker images -q)
re: fclean all run