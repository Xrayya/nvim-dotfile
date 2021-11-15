" Saved session directory
let g:startify_session_dir = '~/.config/nvim/session'

" Menu setup
let g:startify_lists = [
  \ { 'type': 'files',     'header': ['   Files']},
  \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()]},
  \ { 'type': 'sessions',  'header': ['   Sessions']},
  \ { 'type': 'bookmarks', 'header': ['   Bookmarks']},
  \ { 'type': 'commands',  'header': ['   Commands']}
  \ ]

" Bookmarks
let g:startify_bookmarks = [
  \ { 'c': '~\AppData\Local\nvim\init.lua' },
  \ ]

" header
let g:startify_custom_header = [
  \ '    __      __  __               __           __          ______ __                  __  __  __     ',
  \ '   /\ \  __/\ \/\ \             /\ \__       /\ \        /\__  _/\ \      __        /\ \/\ \/\ \    ',
  \ '   \ \ \/\ \ \ \ \ \___      __ \ \ ,_\   ___\ \ \___    \/_/\ \\ \ \___ /\_\    ___\ \ \ \ \ \ \   ',
  \ '    \ \ \ \ \ \ \ \  _ `\  /`__`\\ \ \/  / ___\ \  _ `\     \ \ \\ \  _ `\/\ \  / ,__\ \ \ \ \ \ \  ',
  \ '     \ \ \_/ \_\ \ \ \ \ \/\ \L\.\\ \ \_/\ \__/\ \ \ \ \     \ \ \\ \ \ \ \ \ \/\__, `\ \_\ \_\ \_\ ',
  \ '      \ `\___x___/\ \_\ \_\ \__/.\_\ \__\ \____\\ \_\ \_\     \ \_\\ \_\ \_\ \_\/\____/\/\_\/\_\/\_\',
  \ '       `\/__//__/  \/_/\/_/\/__/\/_/\/__/\/____/ \/_/\/_/      \/_/ \/_/\/_/\/_/\/___/  \/_/\/_/\/_/',
  \ ]
