let g:impl_dirs = "app/assets"

if finddir('spec', '.;') == "spec"
  let g:test_dirs  = "spec"
  let g:test_token = "_spec"
endif

command! -buffer Alternate call alternate#Alternate()
