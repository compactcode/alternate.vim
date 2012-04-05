if finddir('app/assets', '.;') == "app/assets"
  let b:alternate_source_dirs = "app/assets"
endif

if finddir('spec', '.;') == "spec"
  let b:alternate_test_dirs  = "spec"
endif

let b:alternate_test_token = "_spec"

command! -buffer -nargs=0 Alternate call alternate#Alternate()
