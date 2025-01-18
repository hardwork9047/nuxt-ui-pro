#!/bin/bash
sudo rm -rf src/.nuxt/
docker compose up -d
sudo chmod 777 src/.nuxt/*