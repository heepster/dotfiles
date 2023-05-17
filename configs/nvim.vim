
set list
set tabstop=2
set shiftwidth=2
set expandtab
set autoindent
set smartindent
set title
set incsearch
set hlsearch
set ignorecase
set smartcase
set wildmode=longest,list,full
set wildmenu
set showcmd
set hidden
set report=0
set numberwidth=6
set number
set lazyredraw
set ttyfast
set directory=/var/tmp
set backspace=indent,eol,start
set updatetime=300
set cmdheight=1
set nowrap
"set cursorline
set autoread
set termguicolors
"set fillchars=eob:\ 
set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable

" Always keep the SignColumn transparent bg
autocmd BufRead,BufNewFile * highlight clear SignColumn

" Colors
" https://jonasjacek.github.io/colors/

syntax on
syntax enable
silent !stty -ixon > /dev/null 2>/dev/null
"nnoremap <CR> :nohlsearch<CR>
let mapleader = ","

" Auto remove trailing whitespaces
autocmd FileType typescript,javascript,c,cpp,java,php,scala,python,ruby autocmd BufWritePre <buffer> %s/\s\+$//e

" Auto Resize windows
autocmd VimResized * wincmd =

" Trigger refresh file on (& if) disk change whenever cursor stops moving
au CursorHold,CursorHoldI * checktime

call plug#begin(stdpath('data') . '/plugged')
  Plug 'itchyny/lightline.vim'
  Plug 'tpope/vim-fugitive'
       " Plugins for Vim Fugitive GBrowse
       " Plug 'tommcdo/vim-fubitive' " Bitbucket
       Plug 'tpope/vim-rhubarb' " Github
  Plug 'ruanyl/vim-gh-line'

  " Required for telescope, neorg
  Plug 'nvim-lua/plenary.nvim' 

  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.1' }
  Plug 'nvim-neorg/neorg'

  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
    " :TSInstall rust typescript bash ruby go json

  Plug 'mhinz/vim-startify'
  Plug 'ggandor/leap.nvim'

  "Themes
  Plug 'rafi/awesome-vim-colorschemes'
  Plug 'jeffkreeftmeijer/vim-dim'
  Plug 'catppuccin/nvim', { 'branch': 'main', 'as': 'catppuccin' }

  " NvimTree
  Plug 'nvim-tree/nvim-web-devicons' " optional
  Plug 'nvim-tree/nvim-tree.lua'

  " Languages
  Plug 'rust-lang/rust.vim'
  Plug 'pangloss/vim-javascript'
  Plug 'derekwyatt/vim-scala'
  Plug 'chrisbra/csv.vim'
  Plug 'GEverding/vim-hocon'
  Plug 'digitaltoad/vim-pug'
  Plug 'HerringtonDarkholme/yats.vim'
  Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
  Plug 'jparise/vim-graphql',
  Plug 'neoclide/coc.nvim', { 'branch': 'release' }
    " To Install specific language servers
    " :CocInstall coc-tsserver coc-json coc-html coc-css coc-rust-analyzer coc-snippets

  Plug 'alexghergh/nvim-tmux-navigation'

  Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

call plug#end()

""" Theme
" colorscheme catppuccin-mocha
colorscheme catppuccin-mocha

" Cursor
"highlight CursorLine cterm=NONE ctermbg=grey ctermfg=white guibg=grey guifg=white

""" Key mappings
map <C-s> :w<CR>
imap <C-s> <ESC>:w<CR>
map <C-q> :q<CR>
imap <C-q> <ESC>:q!<CR>
nnoremap <Leader>e :vsplit $MYVIMRC<CR>
nnoremap <Leader>s :so $MYVIMRC<CR>
nnoremap <Leader>b :Git blame<CR>
nnoremap <Leader>p :PlugInstall<CR>
map <C-t>l :execute "tabnext"<CR>
map <C-t>h :execute "tabprev"<CR>
nnoremap <silent> <C-h> <Cmd>NvimTmuxNavigateLeft<CR>
nnoremap <silent> <C-j> <Cmd>NvimTmuxNavigateDown<CR>
nnoremap <silent> <C-k> <Cmd>NvimTmuxNavigateUp<CR>
nnoremap <silent> <C-l> <Cmd>NvimTmuxNavigateRight<CR>
nnoremap <silent> <C-t> <Cmd>ToggleTerm direction=vertical<CR>

""" NvimTree
map <C-e> :NvimTreeToggle<CR>

""" COC
" Tab for autocompletion
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gI <Plug>(coc-codeaction-cursor)
nnoremap <silent><nowait> ga  :<C-u>CocList diagnostics<cr>

" Symbol renaming.
nmap <silent> gn <Plug>(coc-rename)

nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
" autocmd CursorHold * silent call CocActionAsync('highlight')

" Scrolling within pop up
nnoremap <nowait><expr> <j> coc#float#has_scroll() ? coc#float#scroll(1) : "\<j>"
nnoremap <nowait><expr> <k> coc#float#has_scroll() ? coc#float#scroll(0) : "\<k>"

nnoremap <silent> <C-p> :Telescope find_files<CR>
nnoremap <silent> <C-a> :Telescope live_grep<CR>
nnoremap <silent> <C-f> :Telescope current_buffer_fuzzy_find<CR>
nnoremap <silent> <C-g> :Telescope git_bcommits<CR>

""" FILE SPECIFIC
au FileType fish compiler fish
au BufNewFile,BufRead *.pegjs set filetype=javascript
au BufNewFile,BufRead *.jsx set filetype=javascript
au BufNewFile,BufRead *.cjsx set filetype=javascript
au BufNewFile,BufRead *.ts set filetype=typescript
au BufNewFile,BufRead *.cap set filetype=ruby
au BufNewFile,BufRead *.ejs set filetype=html
au BufNewFile,BufRead *.pug set filetype=pug
au BufNewFile,BufRead Gemfile set filetype=ruby
au! BufRead,BufNewFile *.json set filetype=json
au! FileType c,cpp,java,php call CSyntaxAfter()
au BufRead,BufNewFile *.sbt set filetype=scala
autocmd FileType json syntax match Comment +\/\/.\+$+
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

let g:lightline =  {
      \ 'colorscheme': 'catppuccin',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'readonly', 'fugitive', 'filename', 'modified' ],
      \             [ 'cocstatus' ] ],
      \   'right': [['lineinfo'], ['percent'], ['fileencoding', 'filetype']]
      \ },
      \ 'inactive': {
      \   'left': [['filename']],
      \   'right': [['lineinfo'], ['percent']]
      \ },
      \ 'component_function': {
      \   'fugitive': 'FugitiveStatusline',
      \   'cocstatus': 'coc#status'
      \ }
      \ }
" Auto update lightline
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" NvimTree Load
lua << EOF
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local function my_on_attach(bufnr) 
  local api = require('nvim-tree.api')
  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

  api.config.mappings.default_on_attach(bufnr)

  vim.keymap.set('n', '<C-e>', api.tree.toggle, opts('Toggle'))
end
  
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    width = 50,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
  on_attach = my_on_attach
})

require("nvim-tmux-navigation")

require('leap')
vim.keymap.set('n', 'f', '<Plug>(leap-forward-to)')
vim.keymap.set('n', 'F', '<Plug>(leap-backward-to)')


require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all" (the five listed parsers should always be installed)
  ensure_installed = { "c", "lua", "vim", "vimdoc", "query", "rust", "typescript", "go", "bash", "ruby", "javascript" },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
  auto_install = true,

  -- List of parsers to ignore installing (for "all")
  -- ignore_install = { "javascript" },

  ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
  -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

  highlight = {
    enable = true,

    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
    -- the name of the parser)
    -- list of language that will be disabled
    -- disable = { "c", "rust" },
    -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
    disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
            return true
        end
    end,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
}

require("catppuccin").setup {
    flavor = "frappe",
    integrations = {
    },
    color_overrides = {
        all = {
            -- text = "#ffffff",
        },
        mocha = {
            -- flamingo = "#ffffff",
        }
    }
}
vim.cmd.colorscheme "catppuccin"


require('neorg').setup {
    load = {
        ["core.defaults"] = {}, -- Loads default behaviour
        ["core.concealer"] = {}, -- Adds pretty icons to your documents
        -- ["core.completion"] = {}, 
        ["core.dirman"] = { -- Manages Neorg workspaces
            config = {
                workspaces = {
                    notes = "~/notes",
                },
            },
        },
    },
}


function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')

require("toggleterm").setup {
  -- size can be a number or function which is passed the current terminal
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  open_mapping = [[<c-t]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_terminals = false,
  autochdir = false, -- when neovim changes it current directory the terminal will change it's own when next it's opened
  shell = "/bin/zsh",
  auto_scroll = true, -- automatically scroll to the bottom on terminal output
  winbar = {
    enabled = false,
    name_formatter = function(term) --  term: Terminal
      return term.name
    end
  }
}

EOF

