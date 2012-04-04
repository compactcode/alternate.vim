#### alternate.vim

A lightweight vim plugin for switching between test and implementation files.

### Usage

Toggle between test and implmentation files:

```vim
:Alternate
```

Find and run the test file (runs the current file if it is a test):

```vim
:RunTestUsing("rspec")
```

### Configuration

```vim
" Switch between test and implementation files
nnoremap <Leader>a :Alternate<CR>

" Quickly find and run a ruby test file using rspec
autocmd FileType ruby   nnoremap <buffer> <Leader>r :RunTestUsing("rspec")<CR>

" Quickly find and run a python test file using nose
autocmd FileType python nnoremap <buffer> <Leader>r :RunTestUsing("nosetests")<CR>
```

### Supported Project Conventions

#### Ruby

```
{app,lib}/**/foo.rb -> spec/**/foo_spec.rb
{app,lib}/**/foo.rb -> test/**/foo_unit.rb
```

#### Python

```
**/foo.py -> **/test_foo.py
```

#### Coffee Script

```
app/assets/**/foo.js.coffee -> spec/**/foo_spec.js.coffee
```

