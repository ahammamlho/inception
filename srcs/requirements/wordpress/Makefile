all:
	docker build -t wdp .
run:
	docker run --env-file ../../.env -dt -p 8080:80 --name c_wdp wdp
exec:
	docker exec -it c_wdp bash
clean:
	docker rm -f $$(docker ps -aq)
fclean: clean
	docker rmi $$(docker images -q)