# Neon
Neon is a skin for osu! and osu!(lazer).

## Build instructions
To compile the skin you need:

  - A Unix command-line environment (WSL or MSYS2 on Windows)
  - GNU Make
  - Inkscape, in the PATH of your Unix environment
  - [Montserrat](https://fonts.google.com/specimen/Montserrat).

If you have installed Inkscape in WSL, you should install Montserrat
in WSL's font directory:

```console
$ mkdir -p ~/.local/share/fonts/
$ cp Montserrat-VariableFont_wght.ttf ~/.local/share/fonts/
$ fc-cache
```

To build the skin for use in osu!, run `make` in this directory. To
export a `.osk` file for installing or sharing, run `make dist`.

## Caveats

  - osu!(stable) song select is for 16:9.

## License
Copyright (C) 2024 McEndu. Portions of the skin copyright (C) 2024 ppy
Pty Ltd.

This repository is licensed under [Creative Commons
Attribution-NonCommercial 4.0 International][CC-BY-SA-4.0]; see the link
for more information. A copy of the legal code is included with this
skin.

[CC-BY-SA-4.0]: https://www.creativecommons.org/licenses/by-nc/4.0/deed.en
