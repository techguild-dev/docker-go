# dockerの基本操作
<!-- TOC -->
* [dockerでimageを作成するコマンド](#dockerでimageを作成するコマンド)
* [dockerでimagesを確認するコマンド](#dockerでimagesを確認するコマンド)
* [dockerでコンテナを作成するコマンド](#dockerでコンテナを作成するコマンド)
* [dockerでlocalとmountする](#dockerでlocalとmountする)
* [dockerのコンテナIDを確認するコマンド](#dockerのコンテナidを確認するコマンド)
* [dockerのコンテナのIPアドレスを確認するコマンド](#dockerのコンテナのipアドレスを確認するコマンド)
* [dockerのコンテナに入るコマンド](#dockerのコンテナに入るコマンド)
* [dockerでコンテナを確認するコマンド](#dockerでコンテナを確認するコマンド)
* [dockerでコンテナを停止するコマンド](#dockerでコンテナを停止するコマンド)
<!-- TOC -->

## dockerでimageを作成するコマンド
```shell
docker build -t イメージ名:タグ名 Dockerfileのパス
```
```shell
# dockerでimageを作成するコマンド例
docker build -t go-api:1.0.0 .
```
|オプションと引数|説明|
|:--|:--|
|-t|イメージ名:タグ名を指定する|
|イメージ名|イメージ名とは、作成するイメージの名前を指定する。|
|タグ名|タグ名とは、作成するイメージのバージョンを指定する。|

## dockerでimagesを確認するコマンド
```shell
docker images
```
|オプションと引数|説明|
|:--|:--|
|images|イメージの一覧を表示する|

## dockerでコンテナを作成するコマンド
```shell
docker run -d -p ホスト側のポート番号:コンテナ側のポート番号 イメージ名:タグ名
```
```shell
# dockerでコンテナを作成するコマンド例
docker run -d -p 8080:8080 go-api:1.0.0
```

| オプションと引数 | 説明 |
| ---- | ---- |
|-d|コンテナをバックグラウンドで実行する|
|-p|ホスト側のポート番号:コンテナ側のポート番号を指定する|
|ホスト側のポート番号|ホスト側のポート番号とは、ホスト側で使用するポート番号を指定する。|
|コンテナ側のポート番号|コンテナ側のポート番号とは、コンテナ側で使用するポート番号を指定する。|
|イメージ名|イメージ名とは、作成するコンテナのイメージ名を指定する。|
|タグ名|タグ名とは、作成するコンテナのバージョンを指定する。|

## dockerでlocalとmountする
```shell
docker run -d -p ホスト側のポート番号:コンテナ側のポート番号 -v ホスト側のディレクトリ:コンテナ側のディレクトリ イメージ名:タグ名
```
```shell
# dockerでlocalとmountするコマンド例 
# 注意 : pwdはコマンドを実行したディレクトリのパスを取得するコマンド
docker run -d -p 8080:8080 -v ${PWD}:/go/src go-api:1.0.0
```
|オプションと引数|説明|
| ---- | ---- |
|-v|ホスト側のディレクトリ:コンテナ側のディレクトリを指定する|


## コンテナに入る際に標準入力を有効にする
```shell
docker run -it -p ホスト側のポート番号:コンテナ側のポート番号 イメージ名:タグ名
```
```shell
docker run -it -p 8080:8080 go-api:1.0.0
```

```shell
docker run -it -d -p 8080:8080 go-api:1.0.0
```

|オプションと引数|説明|
| ---- | ---- |
|-it|コンテナに入る際に標準入力を有効にする|


## dockerのコンテナIDを確認するコマンド
```shell
docker ps

#log
CONTAINER ID   IMAGE          COMMAND  CREATED          STATUS          PORTS                      NAMES
8daa295fc7e4   go-api:1.0.0    "/main" 42 seconds ago   Up 41 seconds   0.0.0.0:8080->8080/tcp    exciting_heyrovsky

```

|オプションと引数|説明|
| ---- | ---- |
|ps|コンテナの一覧を表示する|


## dockerのコンテナのIPアドレスを確認するコマンド
```shell
docker inspect -f '{{.NetworkSettings.IPAddress}}' コンテナID
```
```shell
docker inspect -f '{{.NetworkSettings.IPAddress}}' 8daa295fc7e4
```


## dockerのコンテナに入るコマンド
```shell
docker exec -it コンテナID /bin/bash
```

|オプションと引数|説明|
| ---- | ---- |
|exec|コンテナに入る|
|-it|コンテナに入る際に標準入力を有効にする|


## dockerでコンテナを停止するコマンド
```shell
docker stop コンテナID
```

|オプションと引数|説明|
| ---- | ---- |
|stop|コンテナを停止する|
|コンテナID|コンテナIDとは、コンテナを一意に識別するIDを指定する。|

