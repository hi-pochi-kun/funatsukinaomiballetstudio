# Étoile バレエスタジオ サイト

## 初回セットアップ

```
npm install
npm start        # ローカル確認 http://localhost:8080
```

公開用ビルド:
```
npm run build     # _site フォルダに出力される
```

GitHub Pages / Cloudflare Pages にこのリポジトリを接続すれば、
push するたびに自動でビルド・公開されます。

## 更新方法(頻度は低い想定)

すべて `_data/` フォルダの中の該当ファイルを編集するだけで反映されます。
HTMLやCSSを触る必要はありません。

| 変更したい内容 | 編集するファイル |
|---|---|
| 先生の紹介文 | `_data/teacher.json` |
| クラス・スケジュール(スタジオ単位) | `_data/studios.json` |
| 受賞実績の追加 | `_data/awards.json`(配列の先頭に追加) |
| アクセス情報 | `_data/access.json` |
| お問い合わせフォームのURL | `_data/contact.json` |
| 発表会写真(年ごと) | `content/recitals/西暦.md` を新規作成 |

### 例:受賞実績を1件追加する

`_data/awards.json` の配列の先頭に以下を追加:
```json
{"year": 2027, "title": "◯◯コンクール ジュニア部門 優勝", "student": "生徒名"},
```

### 例:来年の発表会写真を追加する

1. `images/recitals/2027/` フォルダを作り、写真ファイルを入れる
2. `content/recitals/2027.md` を新規作成:
```
---
tags: recital
year: 2027
photos:
  - "images/recitals/2027/01.jpg"
  - "images/recitals/2027/02.jpg"
permalink: false
---
```
これだけで発表会写真ページに新しい年が自動的に(新しい順で)追加されます。

### 例:新しいスタジオ・クラスを追加する

`_data/studios.json` の配列に新しいオブジェクトを追加するだけで、
クラス紹介・スケジュールの両方に自動的に反映されます。

## 編集後の反映手順

1. ファイルを編集して保存
2. `npm start` でローカル確認(任意)
3. GitHubにコミット & push
4. 数分待つと公開サイトに反映される
