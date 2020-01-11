#!/bin/bash
# Copyright © 2018 Yu Kobayashi

# 引数に指定されたシェルスクリプトを~/myCommandsフォルダ内にインストールするシェルスクリプト


# インストールするフォルダ
install_directory="${HOME}/myCommands"

# カレントディレクトリに指定されたファイルがあったら${install_directory}にインストール
for i in $@; do
  file_name=$(basename ${i})
  if test -e "$(pwd)/${file_name}"; then
    install "$(pwd)/${file_name}" "${install_directory}/${file_name%.*}"
  else
    echo "${i}のインストールはスキップされました。"
    echo "このコマンドはインストール元のファイルがあるフォルダで実行してください。"
  fi
done
