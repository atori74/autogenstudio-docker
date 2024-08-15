# ベースイメージとしてPython 3.12を使用
FROM python:3.11-slim

# 作業ディレクトリを設定
WORKDIR /autogenstudio

# システムを最新化
RUN apt-get update && apt-get upgrade -y \
    && rm -rf /var/lib/apt/lists/*

RUN pip install autogenstudio

# デフォルトの環境変数を設定
ENV HOST=0.0.0.0
ENV PORT=8081

# 環境変数で指定されたポートを公開
EXPOSE $PORT
# アプリケーションを実行するコマンド
CMD ["/bin/sh", "-c", "autogenstudio ui --host $HOST --port $PORT"]
