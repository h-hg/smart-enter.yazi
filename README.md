# smart-enter

A simple Yazi plugin for entering the child directory, or opening the file.

## Installation

```sh
# Linux/macOS
git clone https://github.com/h-hg/smart-enter.yazi.git ~/.config/yazi/plugins/smart-enter.yazi

# Windows
git clone https://github.com/h-hg/smart-enter.yazi.git $env:APPDATA\yazi\config\plugins\smart-enter.yazi
```

## Usage

Add this to your `keymap.toml`

```toml
[[manager.prepend_keymap]]
on   = [ "<Right>" ]
run  = "plugin --sync smart-enter"
desc = "Enter the child directory, or open the file"


[[manager.prepend_keymap]]
on   = [ "l" ]
run  = "plugin --sync smart-enter"
desc = "Enter the child directory, or open the file"
```
