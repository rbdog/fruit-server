# フルーツサーバー
Dockerを使った簡易WebAPIサーバー、DBの環境構築のサンプルコードです  
WebAPIサーバーが管理ページのホスティングを兼ねています

## フレームワーク/プログラミング言語

- 管理ページ: Flutter (Dart)
- WebAPI: FastAPI (Python)
- DB: PostgresSQL (RDBMS)

## 使い方

> 事前に Docker 実行環境の準備が必要です。

<br>

1. ターミナルで ```/fruit-server``` ディレクトリまで移動します。
パスは人によって異なります

```terminal
$ cd ~/path/to/fruit-server
```

2. ```docker compose up``` コマンドで複数のコンテナを起動します。
dオプションを付けると、現在のターミナルで引き続き作業できます

```terminal
$ docker compose up -d
```

3. ブラウザで URL ```localhost:8000``` にアクセスします。

```browser
localhost:8000
```

4. ```GET``` , ```POST``` , ```PATCH``` , ```DELETE``` のリクエストを試すことができます。

5. コンテナを終了するには、 ```docker-compose down``` を使います。

```trminal
$ docker compose down
```
