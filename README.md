# My Neovim Config

- LSP has been set up for several languages (Java, HTML, CSS, JS, CPP, etc.)
- DAP has been set up for Java, Dart and soon CPP

## To-do

- Provide more documentation for `README`
- Move `nvim-jdtls` config to `lua\plugins` directory using [@pavva91 configuration](https://github.com/mfussenegger/nvim-jdtls/wiki/Sample-Configurations#pavva91-configuration)
- Refactor:
  - `ui`: `nvim-notify`, `noice.nvim`, `vim-illuminate`, `rainbow-delimiters.nvim`, `indent-blankline.nvim`
  - `whichkey`: only contains folder definition, all keymaps stored in their respective plugin config
  - separate essential plugins and extra plugins

## Optional
- Try `codeium.vim` and make comparison with `copilot.vim`

## My Pain Point
- [IN GENERAL] re structurize everything, so that this config can be used easily in multi device mindset; also, specify all the dependencies in `README.md`
- [ ] The structure is ugly
  - [x] clean the core
- [ ] Konfigurasi ini relatif berat, kalau dibawa ke device baru, bisa-bisa meledak
  - [ ] Dependensi tidak terdefinisi dengan baik di README
  - [ ] Butuh pemisahan plugin "esensial" dan "extras"
    - [ ] debugger is extras -> making flutter-tools also extras
    - [ ] games is extras
    - [ ] some part of LSP is essential, some part extras
    - [x] statusline is essentials
    - [x] autocompletion is considered essential
    - [x] colorizer considered essentials
    - [x] colorshceme is essential
    - [x] commentary is very essential
    - [x] database is extras
    - [x] externals is extras
    - [x] gitsigns is essential, lazygit is extras
    - [x] illuminate is essential, but might need refactor
    - [x] markdown-previewer is extras
    - [ ] mason is essential
    - [x] numb is essential, other navigation considered extras
    - [x] nvim-habit is extras
    - [x] plantuml is extras
    - [x] project is essential
    - [x] session manager is essential
    - [ ] symbols outline is extras, I think should be under lsp too
    - [x] telescope is essential
    - [x] treesitter is essential
    - [ ] ui, I think it's extras
    - [x] vimtex is extras
    - [x] whichkey is essential
  - LSP Module just simply really ugly
  - Statusline also ugly
    - [ ] The component, need lots of refactor
  - utils is ugly
    - [ ] icons, need a more gracful way to handle it
  - native snippet
  - AI adapter, the experience is so bad
  - colorizer need a more clever way to extend
  - the colorscheme choosen should live outside colorscheme config
  - Database..., is it really needed, the external dependencies is very heavy
  - I think illuminate should be placed in ui
  - I think we need to at least look for alternatives for markdown-previewer
  - need to check nvim-habit, just delete it if it doesn't work anymore
  - the UX of project is not so good, I need a way to be able to manually control the root directory, tho by default, it should be automatic
  - I really need telescope plugin that override buitin lsp buf behaviours
  - Treesitter is ugly, I wonder if there's a better way to fix it
  - keymap configuration is ugly
