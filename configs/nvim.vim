
set shell=/bin/bash
set so=7
set ai
set expandtab
set tabstop=2
set shiftwidth=2
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
  Plug 'scrooloose/nerdTree'
  Plug 'itchyny/lightline.vim'
  Plug 'tpope/vim-fugitive'
       " Plugins for Vim Fugitive GBrowse
       Plug 'tommcdo/vim-fubitive' " Bitbucket
       Plug 'tpope/vim-rhubarb' " Github
  Plug 'ruanyl/vim-gh-line'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  Plug 'mhinz/vim-startify'
  Plug 'ggandor/leap.nvim'

  "Themes
  Plug 'rafi/awesome-vim-colorschemes'
  Plug 'jeffkreeftmeijer/vim-dim'
  Plug 'catppuccin/vim', { 'as': 'catppuccin' }

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
    " :CocInstall coc-tsserver coc-json coc-html coc-css coc-rust-analyzer

  Plug 'alexghergh/nvim-tmux-navigation'

call plug#end()

""" Theme
colorscheme catppuccin_mocha

" Cursor
"highlight CursorLine cterm=NONE ctermbg=grey ctermfg=white guibg=grey guifg=white

""" Key mappings
nnoremap <Leader>e :vsplit $MYVIMRC<CR>
nnoremap <Leader>s :so $MYVIMRC<CR>
nnoremap <Leader>b :Gblame<CR>
nnoremap <Leader>p :PlugInstall<CR>
map <C-t>l :execute "tabnext"<CR>
map <C-t>h :execute "tabprev"<CR>

" Remap cursor beginning
nnoremap <C-h> ^
vnoremap <C-h> ^

" Remap cursor end
nnoremap <C-l> $
vnoremap <C-l> $

" Remap page down
nnoremap <C-j> <C-d>
vnoremap <C-j> <C-d>

" Remap page up
nnoremap <C-k> <C-u>
vnoremap <C-k> <C-u>

" Tmux / Nvim Navigation
nnoremap <silent> <C-h> <Cmd>NvimTmuxNavigateLeft<CR>
nnoremap <silent> <C-j> <Cmd>NvimTmuxNavigateDown<CR>
nnoremap <silent> <C-k> <Cmd>NvimTmuxNavigateUp<CR>
nnoremap <silent> <C-l> <Cmd>NvimTmuxNavigateRight<CR>

""" NvimTree
map <C-e> :NvimTreeToggle<CR>

""" COC
" Tab for autocompletion
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent><nowait> ga  :<C-u>CocList diagnostics<cr>

" Symbol renaming.
nmap <leader>gn <Plug>(coc-rename)

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

""" FZF
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case -- %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction

command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>0)
nnoremap <silent> <C-p> :GFiles<CR>
nnoremap <silent> <C-s> :RG<CR>
nnoremap <silent> <C-f> :BLines<CR>
nnoremap <silent> <C-m> :Marks<CR>
nnoremap <silent> <C-b> :Buffers<CR>

" Navigate quickfix list with ease
nnoremap <silent> [q :cprevious<CR>
nnoremap <silent> ]q :cnext<CR>

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
      \ 'colorscheme': 'onedark',
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
let g:lightline = {'colorscheme': 'catppuccin_mocha'}

" NvimTree Load
lua << EOF
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local function my_on_attach(bufnr) 
  local api = require('nvim-tree.api')
  local function opts(desc)
    return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
  end

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
  -- on_attach = my_on_attach,
})
EOF

lua require("nvim-tmux-navigation")
lua require('leap').add_default_mappings()
