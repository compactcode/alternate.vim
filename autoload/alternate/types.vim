function alternate#types#Javascript()
  " Assume jasmine as the default test tool.
  let b:alternate_test_token          = "_spec"
  let b:alternate_test_token_location = "$"

  if s:Exists('app/assets/javascripts')
    let b:alternate_source_dirs = "app/assets/javascripts"
  else
    let b:alternate_source_dirs = "**"
  endif

  if s:Exists('spec/javascripts')
    let b:alternate_test_dirs  = "spec/javascripts"
  elseif s:Exists('spec')
    let b:alternate_test_dirs  = "spec"
  else
    let b:alternate_test_dirs   = "**"
  endif

  let b:alternate_enabled = 1
endfunction

function alternate#types#Ruby()
  " Assume test unit as the default test tool.
  let b:alternate_test_token          = "_test"
  let b:alternate_test_token_location = "$"

  if s:Exists('app')
    let b:alternate_source_dirs = "app,lib"
  elseif s:Exists('lib')
    let b:alternate_source_dirs = "lib"
  else
    let b:alternate_source_dirs = "**"
  endif

  if s:Exists('spec')
    let b:alternate_test_dirs  = "spec"
    let b:alternate_test_token = "_spec"
  elseif s:Exists('test')
    let b:alternate_test_dirs  = "test"
  else
    let b:alternate_test_dirs  = "**"
  endif

  let b:alternate_enabled = 1
endfunction

function alternate#types#Python()
  " Assume test unit as the default test tool.
  let b:alternate_test_token          = "test_"
  let b:alternate_test_token_location = "^"

  let b:alternate_source_dirs = "**"

  if s:Exists('test')
    let b:alternate_test_dirs  = "test"
  else
    let b:alternate_test_dirs  = "**"
  endif

  let b:alternate_enabled = 1
endfunction

function alternate#types#Haskell()
  " Quickcheck test module files begin with
  " this by convention
  let b:alternate_test_token          = "Qc"
  let b:alternate_test_token_location = "^"

  let b:alternate_source_dirs = "**"

  " Cabal project recommended test directory:
  " http://www.haskell.org/haskellwiki/Structure_of_a_Haskell_project
  if s:Exists('testsuite/tests/')
    let b:alternate_test_dirs  = "testsuite/tests"
  else
    let b:alternate_test_dirs  = "**"
  endif

  let b:alternate_enabled = 1
endfunction

function alternate#types#Cpp()
  let b:alternate_test_token          = "Test"
  let b:alternate_test_token_location = "^"

  let b:alternate_source_dirs = "**,.."
  let b:alternate_test_dirs  = "test,**,."

  let b:alternate_enabled = 1
endfunction

function s:Exists(path)
  return finddir(a:path, '.;') == a:path
endfunction
