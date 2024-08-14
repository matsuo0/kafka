# 条件
- Dockerがインストールされていること
- makeコマンドが使えること

# 起動方法
makeコマンドで実行可能です。

- Dockerイメージのビルド
make build

- コンテナの起動
make run

- コンテナの停止
make stop

- Topicの作成
make topicc
  - 注意事項
    すでにtopicが存在する場合は、エラーメッセージが表示される場合があります。
    make producer, make consumerはそれぞれ実行可能です。
    
- メッセージのプロデュース（メッセージの送信）プロンプトからメッセージを送信可能
make producer

- メッセージのコンシューム（メッセージの受信）Topicからメッセージをメッセージを読み取ります。
make consumer

- コンテナの削除
make destroy

- コンテナの初期化
make init

# テスト方法 1(コンソールでの確認)
- コンテナの起動 : make build, make upの実行
- Topicの作成 : make topicの実行(my-topicという名前のTopicを作成)
- コンソールで確認するために、ターミナルを複数表示させる(Producer, Consumer用) 
- Producer側の実行 : make producerの実行
- Consumer側の実行 : make consumerの実行
- Producer側でメッセージの送信 : 任意のメッセージをProducer側で送信します。
- Consumer側でメッセージの確認 : Consumer側でメッセージを確認します。

# テスト方法 2(producer, consumerアプリから確認)
- コンテナの起動 : make build, make upの実行
- Topicの作成 : make create-topic-post-likesの実行(post-likesという名前のTopicを作成)
- コンソールで確認するために、ターミナルを複数表示させる(Producer, Consumer用) 
- Consumer側の実行 : /cmd/consumer/main.goの実行
- Producer側の実行 : /cmd/producer/main.goの実行
- Consumer側、Producer側でメッセージの確認