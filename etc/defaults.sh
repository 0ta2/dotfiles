#!/bin/bash

#------------------------------
# 一般
#------------------------------
# 外観モードをダークに変更
defaults write -g AppleInterfaceStyle -string "Dark"

#------------------------------
# Dock
#------------------------------
# Dock のサイズ変更
defaults write com.apple.dock tilesize -integer 30

# Dock の拡大にチェックを入れる
defaults write com.apple.dock magnification -bool true

# Dock の拡大率を変更
defaults write com.apple.dock largesize -int 70

# Dock に表示されているものをすべて削除し､起動中のものだけ表示
defaults write com.apple.dock persistent-apps -array

# Dock を自動的に表示/非表示
defaults write com.apple.dock autohide -bool true

#------------------------------
# セキュリティとプライバシー
#------------------------------
# 一般 -> スリープとスクリーンセイバの解除にパスワードを要求 4時間に変更
defaults write com.apple.screensaver askForPasswordDelay -integer 14400

# ダウンロードしたアプリケーションの実行許可 -> App Store と確認済みの開発元からのアプリケーションを許可
defaults write com.apple.LaunchServices LSQuarantine -bool false

#------------------------------
# Spotlight
#------------------------------
# 検索結果のすべてのチェックを外す
defaults write com.apple.spotlight orderedItems -array \
      '{"enabled" = 0;"name" = "PDF";}' \
      '{"enabled" = 0;"name" = "MENU_SPOTLIGHT_SUGGESTIONS";}' \
      '{"enabled" = 0;"name" = "MENU_OTHER";}' \
      '{"enabled" = 0;"name" = "APPLICATIONS";}' \
      '{"enabled" = 0;"name" = "EVENT_TODO";}' \
      '{"enabled" = 0;"name" = "IMAGES";}' \
      '{"enabled" = 0;"name" = "SYSTEM_PREFS";}' \
      '{"enabled" = 0;"name" = "SPREADSHEETS";}' \
      '{"enabled" = 0;"name" = "BOOKMARKS";}' \
      '{"enabled" = 0;"name" = "PRESENTATIONS";}' \
      '{"enabled" = 0;"name" = "DIRECTORIES";}' \
      '{"enabled" = 0;"name" = "FONTS";}' \
      '{"enabled" = 0;"name" = "MUSIC";}' \
      '{"enabled" = 0;"name" = "MOVIES";}' \
      '{"enabled" = 0;"name" = "MESSAGES";}' \
      '{"enabled" = 0;"name" = "MENU_CONVERSION";}' \
      '{"enabled" = 0;"name" = "MENU_DEFINITION";}' \
      '{"enabled" = 0;"name" = "DOCUMENTS";}' \
      '{"enabled" = 0;"name" = "MENU_EXPRESSION";}' \
      '{"enabled" = 0;"name" = "CONTACT";}' \
      '{"enabled" = 0;"name" = "MENU_WEBSEARCH";}' \
      '{"enabled" = 0;"name" = "SOURCE";}'

#------------------------------
# キーボード
#------------------------------
# ショートカット -> Spotlight ショートカットのチェックを外す
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 64 "<dict><key>enabled</key><false/></dict>"

# ショートカット -> 入力ソース -> 前の入力ソースを選択 を Cntrol + スペース に変更
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 60 "
      <dict>
        <key>enabled</key>
        <true/>
        <key>value</key>
        <dict>
          <key>parameters</key>
          <array>
            <integer>32</integer>
            <integer>49</integer>
            <integer>262144</integer>
          </array>
          <key>type</key>
          <string>standard</string>
        </dict>
      </dict>
"

# ショートカット -> 入力ソース -> 入力メニューの次のソースを選択 を Cntrol + shift + スペース に変更
defaults write com.apple.symbolichotkeys AppleSymbolicHotKeys -dict-add 61 "
      <dict>
        <key>enabled</key>
        <true/>
        <key>value</key>
        <dict>
          <key>parameters</key>
          <array>
            <integer>32</integer>
            <integer>49</integer>
            <integer>393216</integer>
          </array>
          <key>type</key>
          <string>standard</string>
        </dict>
      </dict>
"

# フルキーボードアクセス: Tabキーを押して大ウインドウやダイアログ内の操作対象を移動する機能の適用範囲 -> すべてのコントロール
defaults write -g AppleKeyboardUIMode -int 2

# 入力ソース -> USキー と ひらがな(Google)
defaults write com.apple.HIToolbox AppleEnabledInputSources -array \
        '{"Bundle ID" = "com.apple.inputmethod.Kotoeri";"Input Mode" = "com.apple.inputmethod.Japanese";InputSourceKind = "Input Mode";}' \
        '{"Bundle ID" = "com.apple.inputmethod.Kotoeri";"Input Mode" = "com.apple.inputmethod.Roman";InputSourceKind = "Input Mode";}' \
        '{"Bundle ID" = "com.apple.50onPaletteIM";InputSourceKind = "Non Keyboard Input Method";}' \
        '{"Bundle ID" = "com.google.inputmethod.Japanese";"Input Mode" = "com.apple.inputmethod.Japanese";InputSourceKind = "Input Mode";}' \
        '{"Bundle ID" = "com.google.inputmethod.Japanese";InputSourceKind = "Keyboard Input Method";}' \
        '{InputSourceKind = "Keyboard Layout";"KeyboardLayout ID" = 252;"KeyboardLayout Name" = ABC;}'

defaults write com.apple.HIToolbox AppleInputSourceHistory -array \
        '{InputSourceKind = "Keyboard Layout";"KeyboardLayout ID" = 252;"KeyboardLayout Name" = ABC;}' \
        '{"Bundle ID" = "com.google.inputmethod.Japanese";"Input Mode" = "com.apple.inputmethod.Japanese";InputSourceKind = "Input Mode";}'

defaults write com.apple.HIToolbox AppleSelectedInputSources -array \
        '{InputSourceKind = "Keyboard Layout";"KeyboardLayout ID" = 252;"KeyboardLayout Name" = ABC;}'

#------------------------------
# トラックパッド
#------------------------------
# ポイントとクリック -> タップでクリック にチェック
defaults write com.apple.AppleMultitouchTrackpad Clicking -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -int 1

# ポイントとクリック -> 軌跡の速さ
defaults write -g com.apple.trackpad.scaling -int 3


#------------------------------
# 共有
#------------------------------
# 時計 -> 日付を表示
defaults write com.apple.menuextra.clock DateFormat -string "M\u6708d\u65e5(EEE)  H:mm" 

#------------------------------
# アクセシビリティ
#------------------------------
# マウスとトラックパッド -> トラックパッドオプション -> ドラックを有効にする
defaults write com.apple.AppleMultitouchTrackpad Dragging -int 1
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Dragging -int 1

#------------------------------
# バッテリー
#------------------------------
# バッテリーの使用状況を割合(%)で表示する
defaults write com.apple.menuextra.battery ShowPercent -string YES
