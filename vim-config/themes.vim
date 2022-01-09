" configure nvcode-color-schemes
let g:nvcode_termcolors = 256
let g:onedark_config = {
      \ 'style' : 'darker',
      \ 'toggle_style_key' : '<NOP>',
      \ }
let g:rose_pine_variant = 'darker'

set termguicolors

colorscheme onedark

" checks if your terminal has 24-bit color support
" if (has("termguicolors"))
"   hi Normal ctermbg=NONE guibg=NONE
" endif
