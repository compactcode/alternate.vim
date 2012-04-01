let g:impl_dirs = "app,lib"

if finddir('spec', '.;') == "spec"
  let g:test_dirs  = "spec"
  let g:test_token = "_spec"
endif

command! -buffer Alternate call alternate#Alternate()
