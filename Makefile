up:
	docker compose up -d
build:
	docker compose build --no-cache --force-rm
# bitnamiの場合
topic:
	docker exec -it kafka-like kafka-topics.sh --create --topic my-topic --bootstrap-server localhost:9093 --partitions 1 --replication-factor 1
topic-list:
	docker exec -it kafka-like kafka-topics.sh --list --bootstrap-server localhost:9092
create-topic-post-likes:
	docker exec -it kafka-like kafka-topics.sh --create --topic post-likes --bootstrap-server localhost:9093 --partitions 1 --replication-factor 1
producer: FORCE
	docker exec -it kafka-like kafka-console-producer.sh --topic my-topic --bootstrap-server localhost:9093
consumer: FORCE
	docker exec -it kafka-like kafka-console-consumer.sh --topic my-topic --bootstrap-server localhost:9093 --from-beginning
# confluentincの場合ファイルの場所が違う
# topic:
# 	docker exec -it kafka-like /usr/bin/kafka-topics --create --topic my-topic --bootstrap-server localhost:9093 --partitions 1 --replication-factor 1
# topic-list:
# 	docker exec -it kafka-like /usr/bin/kafka-topics --list --bootstrap-server localhost:9092
# producer: FORCE
# 	docker exec -it kafka-like /usr/bin/kafka-console-producer --topic my-topic --bootstrap-server localhost:9093
# consumer: FORCE
# 	docker exec -it kafka-like /usr/bin/kafka-console-consumer --topic my-topic --bootstrap-server localhost:9093 --from-beginning
stop:
	docker compose stop
down:
	docker compose down --remove-orphans
restart:
	@make down
	@make up
destroy:
	docker compose down --rmi all --volumes --remove-orphans
destroy-volumes:
	docker compose down --volumes --remove-orphans
ps:
	docker compose ps
logs:
	docker compose logs
logs-watch:
	docker compose logs --follow
zookeeper:
	docker compose exec zookeeper bash
kafka:
	docker compose exec kafka bash

FORCE: