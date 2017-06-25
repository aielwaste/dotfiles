# MacOS Sierra Tweaks


#### disable gatekeeper
```sh
$ sudo spctl --master-disable
$ sudo defaults write /var/db/SystemPolicy-prefs.plist enabled -string no
$ defaults write com.apple.LaunchServices LSQuarantine -bool false

# disable disk iamge verification
$ defaults write com.apple.frameworks.diskimages skip-verify -bool true
$ defaults write com.apple.frameworks.diskimages skip-verify-locked -bool true
$ defaults write com.apple.frameworks.diskimages skip-verify-remote -bool true
```

## System Integrity Protection [As of 10.12.2]

```sh
# status
$ sudo csrutil status
```

```sh
# enable
$ sudo csrutil clear
```

```sh
# disable
$ sudo csrutil disable
```

#### If the output of `nvram -p` contains `csr-active-config`
```sh
$ nvram -p
```
#### for example
`csr-active-config   w%00%00%00`
#### the System Integrity Protection is disabled

```sh
$ sudo csrutil clear
# you should see the following:
Successfully cleared System Integrity Protection. Please restart the machine for the changes to take effect.
```

#### Increase window resize speed for Cocoa applications
```sh
$ defaults write NSGlobalDomain NSWindowResizeTime -float 0.001
```

#### Expand Applications Save Panel by Default
```sh
$ defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
$ defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
$ defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true
```

#### disable annoying resume feature where all the windows reopen on programs systemwide
```sh
$ defaults write NSGlobalDomain NSQuitAlwaysKeepsWindows -bool false
```

#### disable saving to iCloud by default
```sh
$ defaults write NSGlobalDomain NSDocumentSaveNewDocumentsToCloud -bool false
```

#### disable sleep mode
```sh
$ systemsetup -setcomputersleep Off > /dev/null
```

#### disable smart quotes, dashes, and autocorrect
```sh
$ defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
$ defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false
$ defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
```

#### enable HiDPI display modes (restart required)
```sh
$ sudo defaults write /Library/Preferences/com.apple.windowserver DisplayResolutionEnabled -bool true
```

#### Displaying full POSIX path as Finder window title
```sh
$ defaults write com.apple.finder _FXShowPosixPathInTitle -bool true
```

#### Disabling the warning when changing a file extension
```sh
$ defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
```

#### Use column view in all Finder windows by default
```sh
$ defaults write com.apple.finder FXPreferredViewStyle Clmv
```

#### Avoiding the creation of .DS_Store files on network volumes
```sh
$ defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
```

#### Enabling snap-to-grid for icons on the desktop and in other icon views
```sh
$ /usr/libexec/PlistBuddy -c "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
$ /usr/libexec/PlistBuddy -c "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
$ /usr/libexec/PlistBuddy -c "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" ~/Library/Preferences/com.apple.finder.plist
```

#### Disable Dock autohide
```sh
$ defaults write com.apple.dock autohide -bool false
```

#### disable hibernation
```sh
$ sudo pmset -a hibernatemode 0
```

#### Disable computer sleep and stop the display from shutting off
```sh
$ sudo pmset -a sleep 0
$ sudo pmset -a displaysleep 0
```

### Safari

#### Enabling the Develop menu and the Web Inspector in Safari
```sh
$ defaults write com.apple.Safari IncludeDevelopMenu -bool true
$ defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
$ defaults write com.apple.Safari "com.apple.Safari.ContentPageGroupIdentifier.WebKit2DeveloperExtrasEnabled" -bool true
```

#### Adding a context menu item for showing the Web Inspector in web views
```sh
$ defaults write NSGlobalDomain WebKitDeveloperExtras -bool true
```