### alternate.vim

Lightweight plugin for alternating between tests and implementation.

### Usage

Find and edit the alternate file in the current window:

```
:Alternate
```

Find the path of the alternate file:

```
:echo alternate#FindAlternate()
```

Find the path of the test for the current file:

```
:echo alternate#FindTest()
```

Note: This will return the current file if the current file is a test.

### Supported Conventions

#### Ruby

```
{app,lib}/**/foo.rb -> spec/**/foo_spec.rb
{app,lib}/**/foo.rb -> test/**/foo_unit.rb
```

#### Coffee

```
app/assets/**/foo.js.coffee -> spec/**/foo_spec.js.coffee
```

