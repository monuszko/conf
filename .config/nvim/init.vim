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

" Select blocks by indent, in Python etc.
Plug 'michaeljsmith/vim-indent-object'


call plug#end()


" In .robot files, ALWAYS insert 4 spaces when pressing Tab
augroup robot
    autocmd!
    autocmd BufNewFile,BufRead *.robot inoremap <buffer> <Tab> <Space><Space><Space><Space>
augroup END

augroup javas
    autocmd!
    autocmd BufWritePost *.js !eslint %
augroup END

" Automatically install missing plugins with Plug:
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif


set updatetime=100
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

function! ToggleGitGutterBase()
    if g:gitgutter_diff_base != "master"
        echom "Diff base: master"
        let g:gitgutter_diff_base = "master"
    else
        echom "Diff base: HEAD"
        let g:gitgutter_diff_base = "HEAD"
    endif
endfunction

nnoremap <F12> :call ToggleGitGutterBase()<CR>
nmap <F10> :TagbarToggle<CR>

" using ripgrep enables the use of custom .ignore file in project root
let g:gutentags_file_list_command='rg --files'
