#!/bin/bash

# Zookeeperの起動
zookeeper-server-start $CONFLUENT_HOME/etc/kafka/zookeeper.properties &

# Kafkaの起動
kafka-server-start $CONFLUENT_HOME/etc/kafka/server.properties