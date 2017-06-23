dwarffortress.vim
-----------------

A Dwarf Fortress raw file plugin for Vim. Currently only provides syntax highlighting.

## Installation

| Plugin Manager        | Install with... |
| -------------         | ------------- |
| [vim-plug][1]         | `Plug 'kazimuth/dwarffortress.vim'` |
| [pathogen][2]         | `git clone https://github.com/kazimuth/dwarffortress.vim ~/.vim/bundle/dwarffortress.vim` |
| [neobundle.vim][3]    | `NeoBundle 'kazimuth/dwarffortress.vim'` |
| [vundle][4]           | `Plugin 'kazimuth/dwarffortress.vim'` |
| [dein.vim][5]         | `call dein#add('kazimuth/dwarffortress.vim')` |
| none                  | copy all of the files into your `~/.vim` directory |

[1]: https://github.com/junegunn/vim-plug
[2]: https://github.com/tpope/vim-pathogen
[3]: https://github.com/Shougo/neobundle.vim
[4]: https://github.com/gmarik/vundle
[5]: https://github.com/Shougo/dein.vim

## Usage
Edit a raw file with vim. It should have colors.

If it doesn't have colors and it should, see the following section.

## File detection
By default, the plugin looks at the first few lines of every `.txt` file to see if it looks like a raw file.

If it fails, you can do `:set ft=dwarffortress` to force the file to be detected correctly.

Or, you can go to the end of the file, add:
```txt
 vim:ft=dwarffortress:
```
and reopen it.

If you don't want the plugin to guess what files are raw files, you can put:
```vim
let g:dwarffortress_guess=0
```
in your `.vimrc`.

If you want to detect *all* `.txt` files as raw files, you can put:
```vim
let g:dwarffortress_always=1
```
in your `.vimrc`.

When you open a new raw file the highlighting might look a little wonky; just save and reopen it to fix that.

## Other information

See `:help dwarffortress`.
