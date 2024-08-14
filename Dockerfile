# ベースイメージとしてConfluent PlatformのKafkaイメージを使用
FROM confluentinc/cp-server:7.6.1

# 環境変数の設定
ENV CONFLUENT_HOME=/usr/share/confluent
ENV PATH=$CONFLUENT_HOME/bin:$PATH

# 必要なディレクトリの作成
RUN mkdir -p /var/lib/kafka/data /var/lib/zookeeper/data /var/lib/zookeeper/log

# Zookeeperのコンフィグファイルのコピー
COPY zookeeper.properties $CONFLUENT_HOME/etc/kafka/zookeeper.properties

# Kafkaのコンフィグファイルのコピー
COPY server.properties $CONFLUENT_HOME/etc/kafka/server.properties

# ポートのエクスポート
EXPOSE 2181 2888 3888 9092 9093

# ルートユーザーに切り替え
USER root

# ZookeeperとKafkaのエントリーポイントスクリプトを作成
COPY start.sh /usr/bin/start.sh
RUN chmod +x /usr/bin/start.sh

# 必要に応じて元のユーザーに戻す
# USER cp-kafka 

# エントリーポイントの設定
ENTRYPOINT ["/usr/bin/start.sh"]