local set = vim.opt

set.hidden = true
set.whichwrap:append("<,>,[,],h,l")
set.wrap = false
set.wrapscan = false
set.linebreak = true
set.encoding = "utf-8"
set.fileencoding = "utf-8"
set.pumheight = 10
set.ruler = true
set.cmdheight = 1
set.shell = vim.fn.has("win32") > 0 and "pwsh" or vim.fn.executable("fish") > 0 and "fish" or "bash"
set.iskeyword:append("-")
set.mouse = "a"
set.splitbelow = true
set.splitright = true
set.conceallevel = 0
set.signcolumn = "yes"
set.tabstop = 2
set.shiftwidth = 2
set.softtabstop = 2
set.smarttab = true
set.expandtab = true
set.smartindent = true
set.autoindent = true
set.number = true
set.relativenumber = true
set.cursorline = true
set.scrolloff = 9
set.sidescrolloff = 20
set.showtabline = 1
set.laststatus = 3
set.showmode = false
set.backup = false
set.smartcase = true
set.writebackup = false
set.updatetime = 300
set.timeoutlen = 300
set.clipboard:append({ "unnamedplus" })
set.shortmess:append("c")
set.termguicolors = true

vim.cmd([[let &t_Cs = "\e[4:3m"]])
vim.cmd([[let &t_Ce = "\e[4:0m"]])
