# guides

https://dane-bulat.medium.com/how-to-turn-vim-into-a-lightweight-ide-6185e0f47b79

https://dane-bulat.medium.com/vim-setting-up-a-build-system-and-code-completion-for-c-and-c-eb263c0a19a1

# needed for vim plugins:

```
sudo apt-get install ack
```

```
sudo apt-get install ctags
```
```
mkdir -p ~/.vim/bundle
```
```
cd ~/.vim/bundle
```
```
git clone https://github.com/VundleVim/Vundle.vim.git Vundle.vim
```
```
make download
```

# needed for automisation

add to shell config
```
alias insertcpp='cp ~/path-to-configs/templates/cpp/* ./'
```

add function to vimscript
like clang-format <this-file>
```
function! FormatWithClangFormat()
  let l:formatprg_backup=&formatprg
  set formatprg=clang-format\ -style=file
  normal gggqG
  let &formatprg=l:formatprg_backup
endfunction
command! ClangFormat call FormatWithClangFormat()
"	Clang-Format Key Binding
nnoremap <C-e> :ClangFormat<CR>
```

