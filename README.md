# docker_selenium

## 実行方法

### ローカルで直接実行する場合

1. python selenium_on_docker.y

### ローカルのコンテナで実行する場合

#### Docker image の作成

1. docker build -t docker-selenium .

#### コンテナで実行

1. docker run docker-selenium

### リモート(GitHub Actions)で実行する場合

1. git push
