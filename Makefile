.Phony: start create_container create_image start_container stop_container remove_container remove_image

start: create_image create_container start_container

create_image:
	@echo "Create image.."
	docker build --tag 'mockoon-server' .

create_container:
	@echo "Create container.."
	docker container create --name mockoon-server-svc -p 3002:3002 mockoon-server

start_container:
	@echo "Start container.."
	docker container start mockoon-server-svc

stop_container:
	@echo "Stop container.."
	docker container stop mockoon-server-svc

remove_container:
	@echo "Remove container.."
	docker rm mockoon-server-svc

remove_image:
	@echo "Remove image.."
	docker rmi -f mockoon-server