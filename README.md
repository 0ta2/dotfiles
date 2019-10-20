# dotfiles

## Setup
インストールするときは､ `curl` を叩けばOK

```bash
$ curl -fsSL https://raw.githubusercontent.com/0ta2/dotfiles/master/etc/install | bash
```

## install shell で実装できていない箇所は手動でセットアップ
### ログインシェルを変更
```bash
$ sudo sh -c "echo '/usr/local/bin/zsh' >> /etc/shells"
$ chsh -s /usr/local/bin/zsh
```

### pyenv 設定
```bash
$ pyenv init
$ sudo installer -pkg /Library/Developer/CommandLineTools/Packages/macOS_SDK_headers_for_macOS_10.14.pkg -target /
```

### rbenv 設定
```bash
$ rbenv init
```

### nodenv 設定
```bash
$ nodenv init
```

- システム環境設定
  - 共有
    - コンピュータ名を変更

