"===============================================================================
"                                ~My vimrc~
"===============================================================================
" Author:        Kit Pearson [http://trialanderror.io]
" Source:        https://github.com/kpearson/dotfiles
"
" My vimrc, mostly for rails & javascript development. I have organized
" all of my vimrc style configurations into individual files organized
" by functionality. These live in ~/.vim/rcfiles.
"
" I am using Vundle to manage my plugins, which is configured below
" Each plugin is configured in its own file in ~/.vim/rcplugins
"-------------------------------------------------------------------------------

" Set this before any others
  let mapleader = "\<Space>"

  function! s:SourceConfigFilesIn(directory)
    let directory_splat = '~/.vim/' . a:directory . '/*'
    for config_file in split(glob(directory_splat), '\n')
      if filereadable(config_file)
        execute 'source' config_file
      endif
    endfor
  endfunction

" Setup Vundle to manage my bundles
"----------------------------------
  filetype off " required!
  set rtp+=~/.vim/bundle/Vundle.vim/
  call vundle#rc("~/.vim/bundle/")

" Plugins are each listed in their own file. Loop and source ftw
"----------------------------------------------------------------
  call s:SourceConfigFilesIn('rcplugins')

  filetype plugin indent on " required!
  syntax on

" Vimrc is split accross multiple files, so loop over and source each
"---------------------------------------------------------------------
  call s:SourceConfigFilesIn('rcfiles')

" ============ Key Mapping ============
  nnoremap <Leader>w :w<CR>   " Leader w to write
  set timeoutlen=200

  set clipboard=unnamed  " Set Clipboard to Mirror the Default Regester
  set showcmd  " Show the current command context in the lower right
  set makeef=~/##

  nmap <Leader>z :set spell!<CR>

" ============== Markdown ==============
  autocmd BufNewFile,BufReadPost *.md set filetype=markdown
  let g:vim_markdown_frontmatter=1  " Frontmatter highlighting
  let g:vim_markdown_folding_disabled=1

" ========== General Settings ==========

  vnoremap . :norm.<CR>;                " in visual mode, "." will for each line, go into normal mode and execute the "."
  cmap %/ <C-R>=expand("%:p:h")."/"<CR>
  cmap %% <C-R>=expand("%")<CR>
