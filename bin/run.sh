#!/bin/bash

# スクリプトの現在のディレクトリを取得
CURRENT_DIR=$(pwd)

# dockerコマンドを実行
# docker run -it -v ${CURRENT_DIR}/src:/app nuxt
docker run -it nuxt
