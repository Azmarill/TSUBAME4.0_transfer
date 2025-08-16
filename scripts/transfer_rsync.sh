#!/bin/bash

LOCAL_DIR_1="/mnt/c/tsubame_data/push/"
LOCAL_DIR_2="/mnt/c/tsubame_data/pull/"
mkdir -p "$LOCAL_DIR_1"
mkdir -p "$LOCAL_DIR_2"

if [ -z "$1" ]; then
   echo "スクリプトの後にモードを入力してください: $0 [push|pull]"
   exit 1
fi

REMOTE_USER="uw06174"
REMOTE_HOST="login.t4.gsic.titech.ac.jp"
REMOTE_DIR="/home/4/${REMOTE_USER}/data/"
MODE="$1"
SSH_KEY="~/.ssh/id_ed25519"

if [ "$MODE" = "push" ]; then
   echo "ユーザ ${REMOTE_USER}として${REMOTE_HOST}にデータを転送します~"
   rsync -avzh -e "ssh -i ${SSH_KEY}" --progress "$LOCAL_DIR_1" "${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_DIR}"

elif [ "$MODE" = "pull" ]; then
   echo "ユーザ ${REMOTE_USER}として${REMOTE_HOST}からデータを取得します~"
   rsync -avzh -e "ssh -i ${SSH_KEY}" --progress "${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_DIR}" "$LOCAL_DIR_2"

else
   echo "モードが設定されていません。pushもしくはpullを指定してください。"
   exit 1
fi
