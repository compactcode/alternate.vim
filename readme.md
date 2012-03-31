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

### Supported Languages

* ruby - rspec
* coffee - jasmine

