function alternate#types#Javascript()
  if finddir('app/assets', '.;') == "app/assets"
    let b:alternate_source_dirs = "app/assets"
  endif

  if finddir('spec', '.;') == "spec"
    let b:alternate_test_dirs  = "spec"
  endif

  let b:alternate_test_token = "_spec"

  command! -buffer -nargs=0 Alternate call alternate#Alternate()
endfunction

function alternate#types#Ruby()
  if finddir('app', '.;') == "app"
    let b:alternate_source_dirs = "app,lib"
  elseif finddir('lib', '.;') == "lib"
    let b:alternate_source_dirs = "lib"
  endif

  if finddir('spec', '.;') == "spec"
    let b:alternate_test_dirs  = "spec"
    let b:alternate_test_token = "_spec"
  elseif finddir('test', '.;') == "test"
    let b:alternate_test_dirs  = "test"
    let b:alternate_test_token = "_test"
  endif

  command! -buffer -nargs=0 Alternate call alternate#Alternate()
endfunction

function alternate#types#Python()
  let b:alternate_test_token          = "test_"
  let b:alternate_test_token_location = "^"

  command! -buffer -nargs=0 Alternate call alternate#Alternate()
endfunction

