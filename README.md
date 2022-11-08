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

- 外観
  - 外観モードをダークに変更
- デスクトップとDock
  - Dock のサイズ小さく好みのサイズへ変更
  - Dock の拡大を好みの大きさへ変更
  - Dock を自動的に表示/非表示
  - 起動中のアプリケーションをアニメーションで表示をOFF
  - 起動済みのアプリケーションにインジケータを表示をOFF
  - ウインドウをアプリケーションアイコンにしまうをOFF
- プライバシーとセキリティ
  - App Storeと確認済みの開発元からのアプリケーションを許可
- キーボード
  - キーボードショートカット
    - Spotlight ショートカットのチェックを外す
    - 入力ソース -> 前の入力ソースを選択 を Cntrol + スペース に変更
    - 入力ソース -> 入力メニューの次のソースを選択 を Cntrol + shift + スペース に変更
    - 装飾キー -> CapsLock を Ctrl に変更する
    - 入力ソース -> USキー と ひらがな(Google)
- トラックパッド
  - ポイントとクリック -> 軌跡の速さを一番早く
  - ポイントとクリック -> タップでクリック にチェック
- アクセシビリティ
  - トラックパッドオプション -> ドラックにトラックパッドを使用(ドラック方法は、ドラックロックなし)
