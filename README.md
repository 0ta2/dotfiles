# dotfiles

## Setup

インストールするときは､ `curl` を叩けばOK

```bash
curl -fsSL https://raw.githubusercontent.com/0ta2/dotfiles/master/etc/install | bash
```

## install shell で実装できていない箇所は手動でセットアップ

### pyenv 設定

```bash
pyenv activate py2neovim
pip install neovim

pyenv activate py3neovim
pip install neovim
```

### rbenv 設定

```bash
gem install neovim
```

### nodenv 設定

```bash
npm install --global neovim
```
