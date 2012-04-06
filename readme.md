# alternate.vim

A simple vim plugin for finding test and implementation files.

## Usage

Find the alternate file:

```vim
:echo alternate#FindAlternate()
```

Find the test file:

```vim
:echo alternate#FindTest()
```

Run a test file using rspec:

```vim
" Quickly find and run a ruby test file using rspec
autocmd FileType ruby nnoremap <buffer> <Leader>r :execute "! rspec " . alternate#FindTest() <CR>
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

#### {Java,Coffee} Script

```
app/assets/javascripts/**/foo.js.coffee -> spec/javascripts/**/foo_spec.js.coffee
**/foo.js.coffee -> spec/**/foo_spec.js.coffee
```

