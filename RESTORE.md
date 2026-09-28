# How to restore this after a fresh install

This repo holds three separate configs. They go to three separate places —
cloning it alone is not enough, you also need to copy two folders out.

```bash
# 1. AwesomeWM itself — this repo's root IS ~/.config/awesome
git clone git@github.com:imndllnuri/my-awesomewm.git ~/.config/awesome

# 2. picom and rofi — copy these two folders out to their real locations,
#    then remove them from the awesome folder so they don't just sit there
mkdir -p ~/.config/picom ~/.config/rofi
cp ~/.config/awesome/picom/picom.conf   ~/.config/picom/
cp ~/.config/awesome/rofi/*.rasi        ~/.config/rofi/
rm -rf ~/.config/awesome/picom ~/.config/awesome/rofi
```

## After that

- Install `awesome`, `picom`, `rofi`, `alacritty` (or whatever terminal —
  check `rc.lua` for `terminal =`) via apt.
- Start picom: `picom --config ~/.config/picom/picom.conf -b`
- Log into an Awesome session — `rc.lua` and the `multicolor` theme load
  automatically.
- Super+D opens rofi (already styled to match).

## Note on wallpaper

`wallpaper_override` (in this repo's root) names which file in `wallpaper/`
is the currently-picked one — `rc.lua` reads this file directly (see the
`wallpaper_override` search in `rc.lua`).

To change it later, use the picker GUI:

```bash
mkdir -p ~/.local/bin
cp ~/.config/awesome/local-bin/wallpaper-picker ~/.local/bin/
chmod +x ~/.local/bin/wallpaper-picker
rm -rf ~/.config/awesome/local-bin
sudo apt install python3-pyqt6   # the picker's only dependency
```

Then run `wallpaper-picker` from a terminal (it's not bound to a key).
