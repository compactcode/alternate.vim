### alternate.vim

Lightweight plugin for alternating between tests and implementation.

### Usage

Find and edit the alternate file in the current window:

```
:Alternate
```

Find the name of the alternate file:

```
:echo alternate#FindAlternate()
```

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

