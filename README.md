# dotfiles

## Setup
インストールするときは､ `curl` を叩けばOK

```bash
$ curl -fsSL https://raw.githubusercontent.com/0ta2/dotfiles/master/etc/install
```

## install shell で実装できていない箇所は手動でセットアップ

```bash
### ログインシェルを変更
$ sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
$ chsh -s /usr/local/bin/zsh

### フォントを追加
$ cp -f /usr/local/opt/ricty/share/fonts/Ricty*.ttf ~/Library/Fonts/
$ fc-cache -vf
$ pipenv install
```

- システム環境設定
  - 共有
    - コンピュータ名を変更
