-- Saved session directory
vim.g.startify_session_dir = '~/.config/nvim/session'

-- Menu setup
vim.g.startify_lists = {
  { type = 'files',     header = {'   Files'}},
  { type = 'dir',       header = {'   Current Directory '}},
  { type = 'sessions',  header = {'   Sessions'}},
  { type = 'bookmarks', header = {'   Bookmarks'}},
  { type = 'commands',  header = {'   Commands'}}
  }

-- Bookmarks
vim.g.startify_bookmarks = {
  { "c" = '~\AppData\Local\nvim\init.vim' }
  }

-- header
--vim.g.startify_custom_header = [
-- '    __      __  __               __           __          ______ __                  __  __  __     ',
-- '   /\ \  __/\ \/\ \             /\ \__       /\ \        /\__  _/\ \      __        /\ \/\ \/\ \    ',
-- '   \ \ \/\ \ \ \ \ \___      __ \ \ ,_\   ___\ \ \___    \/_/\ \\ \ \___ /\_\    ___\ \ \ \ \ \ \   ',
-- '    \ \ \ \ \ \ \ \  _ `\  /`__`\\ \ \/  / ___\ \  _ `\     \ \ \\ \  _ `\/\ \  / ,__\ \ \ \ \ \ \  ',
-- '     \ \ \_/ \_\ \ \ \ \ \/\ \L\.\\ \ \_/\ \__/\ \ \ \ \     \ \ \\ \ \ \ \ \ \/\__, `\ \_\ \_\ \_\ ',
-- '      \ `\___x___/\ \_\ \_\ \__/.\_\ \__\ \____\\ \_\ \_\     \ \_\\ \_\ \_\ \_\/\____/\/\_\/\_\/\_\',
-- '       `\/__//__/  \/_/\/_/\/__/\/_/\/__/\/____/ \/_/\/_/      \/_/ \/_/\/_/\/_/\/___/  \/_/\/_/\/_/',
-- ]
