set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

tnoremap <Esc> <C-\><C-n>

" plugin manager - plug:
call plug#begin('~/.local/share/nvim/plugged')

" like 'git diff', marks changed lines:
Plug 'airblade/vim-gitgutter'
" Automatically, incrementally generate tags:
Plug 'ludovicchabant/vim-gutentags'
" surround
Plug 'tpope/vim-surround'
" repeat - makes . work for plugins
Plug 'tpope/vim-repeat'
" tagbar - display file structure
Plug 'majutsushi/tagbar'
" syntax highlighting for Robot Framework (automatic tests):
Plug 'mfukar/robotframework-vim'


call plug#end()


" In .robot files, ALWAYS insert 4 spaces when pressing Tab
augroup robot
    autocmd!
    autocmd BufNewFile,BufRead *.robot inoremap <buffer> <Tab> <Space><Space><Space><Space>
augroup END

" Automatically install missing plugins with Plug:
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif


" GitGutter - Glines
"
" usage - :Glines s/\s\+$//
" and so on.
function! GlobalChangedLines(ex_cmd)
  for hunk in GitGutterGetHunks()
    for lnum in range(hunk[2], hunk[2]+hunk[3]-1)
      let cursor = getcurpos()
      silent! execute lnum.a:ex_cmd
      call setpos('.', cursor)
    endfor
  endfor
endfunction

command -nargs=1 Glines call GlobalChangedLines(<q-args>)

" gutentags - show indication in statusline when busy
" but it breaks(clears) the statusline of neovim!
"
" set statusline+=%{gutentags#statusline()}
