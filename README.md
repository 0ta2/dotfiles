# dotfiles

## Setup

インストールするときは､ `curl` を叩けばOK。

```bash
curl -fsSL https://raw.githubusercontent.com/0ta2/dotfiles/master/init/install | bash
```

## install shell で実装できていない箇所は手動でセットアップ

### pyenv 設定

```bash
pyenv activate py2pynvim
pip install pynvim

pyenv activate py3pynvim
pip install pynvim
```

### rbenv 設定

```bash
gem install neovim
```

### nodenv 設定

```bash
npm install --global neovim
```

### npm パッケージのインストール

```bash
npm install
```

## mac セットアップ

- 一般
  - 外観モードをダークに変更
- Dock
  - Dock のサイズ変更を30に変更
  - Dock の拡大にチェックを入れる
  - Dock の拡大率を変更を70へ変更
  - Dock に表示されているものをすべて削除し､起動中のものだけ表示
  - Dock を自動的に表示/非表示
- セキュリティとプライバシー
  - ダウンロードしたアプリケーションの実行許可 -> App Store と確認済みの開発元からのアプリケーションを許可
- Spotlight
  - 検索結果のすべてのチェックを外す
- キーボード
  - ショートカット -> Spotlight ショートカットのチェックを外す
  - ショートカット -> 入力ソース -> 前の入力ソースを選択 を Cntrol + スペース に変更
  - ショートカット -> 入力ソース -> 入力メニューの次のソースを選択 を Cntrol + shift + スペース に変更
  - フルキーボードアクセス: Tabキーを押して大ウインドウやダイアログ内の操作対象を移動する機能の適用範囲 -> すべてのコントロール
  - 入力ソース -> USキー と ひらがな(Google)
  - CapsLock を Ctrl に変更する
- トラックパッド
  - ポイントとクリック -> タップでクリック にチェック
  - ポイントとクリック -> 軌跡の速さ
- 共有
  - 時計 -> 日付を表示
- アクセシビリティ
  - マウスとトラックパッド -> トラックパッドオプション -> ドラックを有効にする
- バッテリー
  - バッテリーの使用状況を割合(%)で表示する
