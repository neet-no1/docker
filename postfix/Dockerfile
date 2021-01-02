# ubuntuを使用
FROM ubuntu

# パッケージを更新
RUN apt update -y && apt upgrade -y
# インストールに必要なものをインストール
RUN apt install -y wget make gcc libdb5.3-dev m4

# ユーザとグループを追加
RUN adduser --group --system postdrop
RUN adduser --group --system postfix

COPY ./start.sh /

ENTRYPOINT ["/start.sh"]
