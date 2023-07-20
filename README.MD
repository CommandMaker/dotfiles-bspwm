# BSPWM Rice (2022)

Ce repository sert à restaurer mon installation d'ArchLinux en cas de formattage.

Theme [Discord](https://github.com/stronk-dev/Tokyo-Night-Linux/tree/master/.config/BetterDiscord/themes)

Specs :
- Lanceur : **Rofi**
- Bar : **eww**
- WM : **bspwm**
- Compositor : **picom-ibhagwan-git**
- Terminal : **URxvt**
- Browser : **Brave**
- Thème : [GTK (Dark-B)](https://www.xfce-look.org/p/1681315)
- Icônes : [Tokyo Night Dark](https://www.gnome-look.org/p/1681475)

Resize Scripts by [zim0369](https://github.com/zim0369/bspwm_i3size)

## TODO

- fix installl script (chaotic-aur installation)

## Divers
### Récupérer le keycode d'une touche avec `xev`
`xev | awk -F'[ )]+' '/^KeyPress/ { a[NR+2] } NR in a { printf "%-3s %s\n", $5, $8 }'`
