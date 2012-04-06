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

## How it works

When you open a recognised file type, alternate examines your working directory for
common associated project layout conventions.

## Recognised Conventions

#### Ruby

```
(app|lib)/**/foo.rb -> spec/**/foo_spec.rb
lib/**/foo.rb -> spec/**/foo_spec.rb
**/foo.rb -> test/**/foo_unit.rb
```

#### Python

```
**/foo.py -> test/**/test_foo.py
**/foo.py -> **/test_foo.py
```

#### (Java|Coffee) Script

```
app/assets/javascripts/**/foo.js.coffee -> spec/javascripts/**/foo_spec.js.coffee
**/foo.js.coffee -> spec/**/foo_spec.js.coffee
```

