"Gui settings
GuiTabline 0
GuiPopupmenu 0
GuiLinespace 1
"GuiFont! Hack\ NF:h10:l
GuiFont! BitstreamVeraSansMono\ NF:h10:l

" configure nvcode-color-schemes
let g:nvcode_termcolors=256
colorscheme nvcode

" tokyonight colorscheme
"colorscheme tokyonight

" checks if your terminal has 24-bit color support
if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif
