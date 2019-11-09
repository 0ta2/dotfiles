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
$ pyenv activate py2neovim
$ pip install neovim

$ pyenv activate py3neovim
$ pip install neovim
```

### rbenv 設定

```bash
$ gem install neovim
```

### nodenv 設定

```bash
$ npm install --global neovim
```

- システム環境設定
  - 共有
    - コンピュータ名を変更

