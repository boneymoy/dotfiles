call plug#begin()
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  "" Auto-Complete
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  "Plug 'dense-analysis/ale'
  Plug 'neovim/nvim-lspconfig'
  "" Maximize
  Plug 'szw/vim-maximizer'
  "" lualine
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'kyazdani42/nvim-web-devicons'
  "" telescope search
  " Plug 'nvim-lua/plenary.nvim'
  " Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
  "" Colorscheme
  Plug 'sainnhe/everforest'
  " Transparent
   Plug 'xiyaowong/nvim-transparent'
call plug#end()

"" UI
colorscheme everforest
set number relativenumber
let g:transparent_enabled = v:true

"highlight Normal guibg=NONE ctermbg=NONE
"highlight NonText guibg=NONE ctermbg=NONE
hi Normal guibg=none ctermbg=none
hi LineNr guibg=none ctermbg=none
hi Folded guibg=none ctermbg=none
hi NonText guibg=none ctermbg=none
hi SpecialKey guibg=none ctermbg=none
hi VertSplit guibg=none ctermbg=none
hi SignColumn guibg=none ctermbg=none
hi EndOfBuffer guibg=none ctermbg=none

"" Utils
set noswapfile
"""" undofile
if !isdirectory("/tmp/.vim-undo-dir")
    call mkdir("/tmp/.vim-undo-dir", "", 0700)
endif
set undodir=/tmp
set undofile

"" set mapleader
nnoremap <SPACE> <Nop>
let mapleader=" "
nnoremap <Leader>s :FZF<CR>

"" Terminal
"""" exit Terminal easy
tnoremap <Esc> <C-\><C-n>

"" Maximize
nnoremap <Leader>m :MaximizerToggle<CR>

"" Window jumping
nnoremap <C-h> <C-w><C-h>
nnoremap <C-j> <C-w><C-j>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-l> <C-w><C-l>

"""" Autocompletion
" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes
highlight CocErrorSign ctermbg=NONE

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

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Symbol renaming
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end


"" Battery popup
"exec --no-startup-id ~/.config/i3/scripts/i3-battery-popup -n -D -L 20 -l 10

lua << END
require('lualine').setup{ options = { theme = 'everforest'}}
require'lspconfig'.pyright.setup{}
END
