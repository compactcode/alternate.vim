if finddir('app', '.;') == "app"
  let g:source_dirs = "app,lib"
elseif finddir('lib', '.;') == "lib"
  let g:source_dirs = "lib"
endif

if finddir('spec', '.;') == "spec"
  let g:test_dirs  = "spec"
  let g:test_token = "_spec"
elseif finddir('test', '.;') == "test"
  let g:test_dirs  = "test"
  let g:test_token = "_test"
endif

command! -buffer Alternate call alternate#Alternate()
