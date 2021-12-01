local set= vim.opt

--syntax enable                               -- Enables syntax highlighing
set.hidden = true                           -- Required to keep multiple buffers open multiple buffers
set.whichwrap = 'b,s,<,>,[,],h,l'
--set.wrap = false                            -- Display long lines as just one line
set.linebreak = true
set.encoding = "utf-8"                      -- The encoding displayed
set.pumheight = 10                          -- Makes popup menu smaller
set.fileencoding = "utf-8"                  -- The encoding written to file
-- set.spell = true
-- set.spelllang = { 'en_us' }
set.ruler = true                            -- Show the cursor position all the time
set.cmdheight = 2                           -- More space for displaying messages
--set.iskeyword+=-                            -- treat dash separated words as a word text object--
set.mouse = "a"                             -- Enable your mouse
set.splitbelow = true                       -- Horizontal splits will automatically be below
set.splitright = true                       -- Vertical splits will automatically be to the right
set.conceallevel = 0                        -- So that I can see `` in markdown files
-- set.signcolumn = "yes"
set.tabstop = 2                             -- Insert 2 spaces for a tab
set.shiftwidth = 2                          -- Change the number of space characters inserted for indentation
set.softtabstop = 2
set.smarttab = true                         -- Makes tabbing smarter will realize you have 2 vs 4
set.expandtab = true                        -- Converts tabs to spaces
set.smartindent = true                      -- Makes indenting smart
set.autoindent = true                       -- Good auto indent
set.number = true                           -- Line numbers
set.relativenumber = true                   -- Relative numbers
set.cursorline = true                       -- Enable highlighting of the current line
set.scrolloff = 9
set.sidescrolloff = 30
set.showtabline = 2                         -- Always show tabs
set.showmode = false                        -- We don't need to see things like -- INSERT -- anymore
set.backup = false                          -- This is recommended by coc
set.writebackup = false                     -- This is recommended by coc
set.updatetime = 300                        -- Faster completion
set.timeoutlen = 300                        -- By default timeoutlen is 1000 ms
--set.formatoptions-=cro                      -- Stop newline continution of comments
set.clipboard:append {"unnamedplus"}        -- Copy paste between vim and everything else
set.shortmess:remove {"c"}
--set.guifont = "Hack\\ Nerd\\ Font:h10:l"    -- Font
vim.cmd('autocmd FileType java setlocal tabstop=4 shiftwidth=4 softtabstop=4')