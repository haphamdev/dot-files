"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
set splitright
set splitbelow

lua require('options')
lua require('plugins')
lua require('lsp')
lua require('keymappings')
lua require('autocmds')


let g:make = 'gmake'
if exists('make')
        let g:make = 'make'
endif

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
let g:CSApprox_loaded = 1

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

set diffopt+=vertical

" Reload vim configuration
nnoremap <leader>rl :so $MYVIMRC<cr>


