#!/bin/bash
# 船附菜穂美バレエスタジオ サイト 更新スクリプト
# 使い方: Downloadsフォルダに新しい ballet-site-FINAL*.zip をダウンロードしたあと、
#         このスクリプトを実行するだけで、最新の内容が自動的に反映されます。
#
# 初回だけ:  chmod +x update-site.sh
# 毎回:      ./update-site.sh

set -e

DOWNLOADS="$HOME/Downloads"
REPO="$(cd "$(dirname "$0")" && pwd)"

echo "Downloadsフォルダから最新のzipを探しています..."
LATEST_ZIP=$(ls -t "$DOWNLOADS"/ballet-site-FINAL*.zip 2>/dev/null | head -n 1)

if [ -z "$LATEST_ZIP" ]; then
  echo "エラー: Downloadsフォルダに ballet-site-FINAL*.zip が見つかりませんでした。"
  echo "先にzipファイルをダウンロードしてから、もう一度実行してください。"
  exit 1
fi

echo "見つかったzip: $LATEST_ZIP"

TMP_DIR=$(mktemp -d)
unzip -q "$LATEST_ZIP" -d "$TMP_DIR"

# zipの中の一番上のフォルダ(ballet-site-final)を見つける
SRC=$(find "$TMP_DIR" -maxdepth 1 -type d -name "ballet-site*" | head -n 1)

if [ -z "$SRC" ]; then
  echo "エラー: zipの中身の形式が想定と違います。"
  rm -rf "$TMP_DIR"
  exit 1
fi

echo "反映しています..."
rm -rf "$REPO/_includes" "$REPO/css" "$REPO/content" "$REPO/_data"
mkdir -p "$REPO/_includes" "$REPO/css" "$REPO/content" "$REPO/_data"
cp -R "$SRC/_includes/." "$REPO/_includes/"
cp -R "$SRC/css/." "$REPO/css/"
cp -R "$SRC/content/." "$REPO/content/"
cp -R "$SRC/_data/." "$REPO/_data/"
cp "$SRC/.eleventy.js" "$REPO/.eleventy.js"

# ※ images フォルダは自動反映しません(すでに入れた本物の画像を消さないため)

rm -rf "$REPO/_site"
rm -rf "$TMP_DIR"

echo ""
echo "反映が完了しました。"
echo "続けて次を実行してサイトを確認してください:"
echo "  npm start"

