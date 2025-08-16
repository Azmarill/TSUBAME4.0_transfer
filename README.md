# tsubame_transfer

このリポジトリは、東京工業大学のスパコン **TSUBAME** とローカルのWindows/Mac PC（WSL環境）間で、ファイルを効率よく双方向（push/pull）に転送するためのスクリプトを提供します。

## 利用方法

スクリプトを使用するには、以下のコマンドをWSL上で実行します。

### データをローカルからTSUBAMEへ送信（push）する場合

```bash
./scripts/transfer_rsync.sh push
```

### データをTSUBAMEからローカルへ取得（pull）する場合

```bash
./scripts/transfer_rsync.sh pull
```

### 例

```bash
# データをTSUBAMEへ送信する場合
./scripts/transfer_rsync.sh push

# データをTSUBAMEから受信する場合
./scripts/transfer_rsync.sh pull
```

## 初期設定方法

事前に以下の設定を済ませておく必要があります。

### 1. WSLの導入

Windows/MacにWSLを導入します。

* [WSLインストールガイド（公式）](https://learn.microsoft.com/ja-jp/windows/wsl/install)

### 2. SSH鍵の作成・設定

TSUBAMEへの鍵登録が済んでいない方は、公式のドキュメントに従って登録を行ってください。

* [TSUBAME SSH公開鍵設定ガイド](https://portal.t4.gsic.titech.ac.jp)

GitHubに公開鍵の登録を行ってください。

* [GitHub Docs](https://docs.github.com/ja/authentication/connecting-to-github-with-ssh/adding-a-new-ssh-key-to-your-github-account)

### 3. ローカルのデータディレクトリ準備

以下のディレクトリを作成しておきます。

* Windows/Macの場所:

  ```
  C:\tsubame_data\push
  C:\tsubame_data\pull
  ```

* WSLからのアクセスパス:

  ```
  /mnt/c/tsubame_data/push
  /mnt/c/tsubame_data/pull
  ```

転送したいファイルを`push`ディレクトリに置きます。

## 注意点

* TSUBAMEはパスフレーズありの公開鍵登録を推奨しています。毎回パスワード入力が求められる場合がありますが、セキュリティのため推奨されています。
