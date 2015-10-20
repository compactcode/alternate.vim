# alternate.vim

Find your test and implementation files.

## Why

When your working on a software project you will often need to:

* Find and open the test for the current source file.
* Find and open the source file for the current test file.
* Find and run the test for the current source file you just modified.

This plugin provides a simple interface to find test and implementation files across
different projects and languages.

## Usage

Find the alternate file:

```vim
:echo alternate#FindAlternate()
```

Find the test file:

```vim
:echo alternate#FindTest()
```
## Usage with [open](https://github.com/compactcode/open.vim)

```vim
:Open(alternate#FindAlternate())
```

Open the alternate file in the current window.

```vim
:OpenVertical(alternate#FindAlternate())
```

Open the alternate file in a new vertical split.

## How it works

When you open a recognised file type, alternate examines your working directory for
common project layout conventions. Once a layout convention is recognised alternate
will use it to scan for alternate files.

### Recognised Conventions

#### Ruby

```
(app|lib)/**/foo.rb <-> spec/**/foo_spec.rb
lib/**/foo.rb <-> spec/**/foo_spec.rb
**/foo.rb <-> test/**/foo_unit.rb
```

#### Python

```
**/foo.py <-> test/**/test_foo.py
**/foo.py <-> **/test_foo.py
```

#### (Java|Coffee) Script

```
app/assets/javascripts/**/foo.js.coffee <-> spec/javascripts/**/foo_spec.js.coffee
**/foo.js.coffee <-> spec/**/foo_spec.js.coffee
```

#### Haskell

```
src/**/foo.hs <-> testsuite/tests/**/Qcfoo.hs
```

#### C++

```
**/Foo.cc <-> **/TestFoo.cc
```

#### Golang

```
**/foo.go <-> **/foo_test.go
```
