" configure nvcode-color-schemes
let g:nvcode_termcolors=256
colorscheme nvcode
"colorscheme panda
"colorscheme onedark

" tokyonight colorscheme
"colorscheme tokyonight

" checks if your terminal has 24-bit color support
if (has("termguicolors"))
  set termguicolors
  hi Normal ctermbg=NONE guibg=NONE
endif
