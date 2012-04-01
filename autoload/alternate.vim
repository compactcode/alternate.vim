let s:impl_dirs           = 'app,lib'
let s:test_dirs           = 'spec'
let s:test_token          = '_spec'
let s:test_token_location = '$'

function alternate#Alternate()
  let alternate = alternate#FindAlternate()
  if len(alternate) > 1
    execute 'edit ' . alternate
  else
    echo 'No alternate file could be found.'
  endif
endfunction

function alternate#FindAlternate()
  let alternates = alternate#FindAllAlternates()
  if len(alternates) > 1
    let current_path = expand('%')
    for alternate_path in alternates
      if s:ParentDirectoryName(current_path) == s:ParentDirectoryName(alternate_path)
        return alternate_path
      endif
    endfor
  endif
  return get(alternates, 0)
endfunction

function alternate#FindAllAlternates()
  let file_name      = expand('%:t:r:r')
  let file_extension = expand('%:e:e')
  if s:IsTest(file_name)
    return s:FindImplMatches(file_name, file_extension)
  else
    return s:FindTestMatches(file_name, file_extension)
  endif
endfunction

function s:TestPattern()
  return  s:test_token . s:test_token_location
endfunction

function s:IsTest(file_name)
  return match(a:file_name, s:TestPattern()) != -1
endfunction

function s:FindImplMatches(test_file_name, extension)
  let impl_name_pattern = substitute(a:test_file_name, s:TestPattern(), '', '') . '.' . a:extension
  return s:FindMatches(s:impl_dirs, impl_name_pattern)
endfunction

function s:FindTestMatches(impl_file_name, extension)
  let test_name_pattern = substitute(a:impl_file_name, s:test_token_location, s:test_token, '') . '.' . a:extension
  return s:FindMatches(s:test_dirs, test_name_pattern)
endfunction

function s:FindMatches(search_dirs, file_name_pattern)
  return split(globpath(a:search_dirs, '**/' . a:file_name_pattern), '\n')
endfunction

function s:ParentDirectoryName(path)
  return fnamemodify(a:path, ':h:t')
endfunction

