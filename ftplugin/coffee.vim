if finddir('app/assets', '.;') == "app/assets"
  let g:impl_dirs = "app/assets"
endif

if finddir('spec', '.;') == "spec"
  let g:test_dirs  = "spec"
endif

let g:test_token = "_spec"

command! -buffer Alternate call alternate#Alternate()
