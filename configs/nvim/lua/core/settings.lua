vim.opt.list = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.title = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wildmode = { "longest","list","full" }
vim.opt.wildmenu = true
vim.opt.showcmd = true
vim.opt.hidden = true
vim.opt.report = 0
vim.opt.numberwidth = 6
vim.opt.number = true
vim.opt.lazyredraw = true
vim.opt.ttyfast = true
vim.opt.directory = "/var/tmp"
vim.opt.backspace = { "indent", "eol" , "start" }
vim.opt.updatetime = 300
vim.opt.cmdheight = 1
vim.opt.wrap = false
vim.opt.autoread = true
vim.opt.termguicolors = true
vim.opt.signcolumn = "yes"

-- Auto reload files if contents change
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})
