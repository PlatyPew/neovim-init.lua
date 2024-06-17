<div align="center">
    <h1>光速 — Speed Of Light ⚡️</h1>
</div>

光速 (Speed Of Light) is a Neovim setup that has been carefully crafted to be feature-rich yet blazingly fast due to lazy loading as much as possible!

![JPG Compression Be Like](https://github.com/PlatyPew/neovim-init.lua/assets/23520617/93f99d8b-2e1f-4457-a182-51cddc47298d)

## 💻 Installation

To install, simply run the `./install.sh` script or run this command.

```bash
nvim --headless "+Lazy! sync" +qa
```

## 📁 File Structure

Plugins are stored and automatically sourced in `lua/plugins/`

```
~/.config/nvim
├── ftplugin
│  └── *.lua
├── init.lua
└── lua
   ├── core
   │  ├── autocmd.lua
   │  ├── functions.lua
   │  ├── mappings.lua
   │  └── options.lua
   └── plugins
      └── *.lua
```
