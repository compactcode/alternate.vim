### alternate.vim

A lightweight vim plugin for switching between test and implementation files.

### Usage

Toggle between test and implmentation files:

```
:Alternate
```

Find the test for the current file:

```
:echo alternate#FindTest()
```

Note: This will return the current file for test files.

### Serious Usage

Find and execute the spec for the current ruby file using [rspec](https://github.com/rspec/rspec-core).

```
:execute "! rspec " . alternate#FindTest()
```

Find and execute the spec for the current coffeescript file using [jest](https://github.com/keithpitt/jest).

```
:execute "! jest " . alternate#FindTest()
```

Find and execute the test for the current python file using [nose](https://github.com/nose-devs/nose).

```
:execute "! nosetests " . alternate#FindTest()
```

And putting it all together...

```
autocmd FileType ruby nnoremap <buffer> <Leader>r :execute "! rspec " . alternate#FindTest() <CR>
autocmd FileType coffee nnoremap <buffer> <Leader>r :execute "! jest " . alternate#FindTest() <CR>
autocmd FileType python nnoremap <buffer> <Leader>r :execute "! nosetests " . alternate#FindTest() <CR>
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

