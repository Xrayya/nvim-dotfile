" configure nvcode-color-schemes
let g:nvcode_termcolors = 256
let g:onedark_config = {
      \ 'style' : 'darker',
      \ 'toggle_style_key' : '<NOP>',
      \ }
let g:rose_pine_variant = 'darker'

let g:tokyonight_style = "storm"

" if has('unix')
if (!exists('neovide'))

  let g:tokyonight_transparent = 1

  let g:tokyonight_italic_keywords = 0
  let g:tokyonight_italic_functions = 0
  let g:tokyonight_italic_variables = 0

endif

set termguicolors

colorscheme tokyonight

" checks if your terminal has 24-bit color support
" if (has("termguicolors"))
"   hi Normal ctermbg=NONE guibg=NONE
" endif
