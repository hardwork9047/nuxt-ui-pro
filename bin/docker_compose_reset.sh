#!/bin/bash

# Docker Compose を停止
docker compose down
# docker build -f docker/Dockerfile -t nuxt .

# .nuxt ディレクトリを削除
sudo rm -rf src/.nuxt/
sudo rm -rf src/node_modules/*

# Docker Compose をバックグラウンドで起動
docker compose up -d

# 120秒間待機（プログレスバー付き）
echo -ne "Waiting for 100 seconds to ensure containers are fully up...\n"

duration=100
bar_length=40  # プログレスバーの長さ（50文字）

for ((i=0; i<=duration; i++)); do
  sleep 1
  progress=$((i * bar_length / duration)) # 進行状況を計算
  printf "\r[%-50s] %d%%" "$(printf '#%.0s' $(seq 1 $progress))" "$((i * 100 / duration))"
done

echo -e "\nContainers are up. Proceeding..."

echo "Setting permissions..."

# 権限変更
sudo chmod 777 src/.nuxt/*

echo "Permissions set successfully."
