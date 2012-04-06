# alternate.vim

A lightweight vim plugin for dealing with test and implementation files.

## Usage

Open the alternate file:

```vim
:Alternate
```

Retrieve the alternate file:

```vim
:echo alternate#FindAlternate()
```

Retrieve the test file:

```vim
:echo alternate#FindTest()
```

Run tests:

```vim
" Quickly find and run a ruby test file using rspec
autocmd FileType ruby nnoremap <buffer> <Leader>r :execute "! rspec " . alternate#FindTest() <CR>

" Quickly find and run a python test file using nose
autocmd FileType python nnoremap <buffer> <Leader>r :execute "! nosetests " . alternate#FindTest() <CR>
```

## Supported Conventions

#### Ruby

```
{app,lib}/**/foo.rb -> spec/**/foo_spec.rb
{app,lib}/**/foo.rb -> test/**/foo_unit.rb
```

#### Python

```
**/foo.py -> test/**/test_foo.py
**/foo.py -> **/test_foo.py
```

#### Coffee Script

```
app/assets/javascripts/**/foo.js.coffee -> spec/javascripts/**/foo_spec.js.coffee
**/foo.js.coffee -> spec/**/foo_spec.js.coffee
```

