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

command! -buffer Alternate call alternate#Alternate()
