# Node.jsのイメージを使用
FROM node:23.6

# 作業ディレクトリを設定
WORKDIR /app

# 必要なツールをインストール
RUN apt-get update && apt-get install -y iputils-ping traceroute

COPY ../src .

RUN rm -rf .nuxt node_modules
RUN npm install --vervose

EXPOSE 3000

# bashシェルを起動
CMD ["/bin/bash"]