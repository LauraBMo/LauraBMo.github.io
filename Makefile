.PHONY: down up log reload prune

up:
	@docker-compose up -d --remove-orphans

down:
	@docker-compose down

log:
	@docker-compose logs -f

reload: down up

prune:
	@docker rmi -f $(docker images -aq) && \
        docker volume prune -f && \
        docker image prune --all -f && \
        docker network prune -f
