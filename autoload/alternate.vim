if !exists("g:impl_dirs")
  let g:impl_dirs = '*'
endif

if !exists("g:test_dirs")
  let g:test_dirs = '*'
endif

if !exists("g:test_token")
  let g:test_token = '_test'
endif

if !exists("g:test_token_location")
  let g:test_token_location = '$'
endif

function alternate#Alternate()
  let alternate = alternate#FindAlternate()
  if len(alternate) > 1
    execute 'edit ' . alternate
  else
    echo 'No alternate file could be found.'
  endif
endfunction

function alternate#FindAlternate()
  let file_path = expand('%')
  return s:FindClosestAlternative(file_path, s:FindAllAlternates())
endfunction

function alternate#FindTest()
  let file_path = expand('%')
  let file_name = expand('%:t:r:r')
  if s:IsTest(file_name)
    return file_path
  endif
  let file_extension = expand('%:e:e')
  return s:FindClosestAlternative(file_path, s:FindTestMatches(file_name, file_extension))
endfunction

function s:FindClosestAlternative(file_path, alternative_paths)
  if len(a:alternative_paths) > 1
    for alternate_path in a:alternative_paths
      if s:ParentDirectoryName(a:file_path) == s:ParentDirectoryName(alternate_path)
        return alternate_path
      endif
    endfor
  endif
  return get(a:alternative_paths, 0)
endfunction

function s:FindAllAlternates()
  let file_name      = expand('%:t:r:r')
  let file_extension = expand('%:e:e')
  if s:IsTest(file_name)
    return s:FindImplMatches(file_name, file_extension)
  else
    return s:FindTestMatches(file_name, file_extension)
  endif
endfunction

function s:IsTest(file_name)
  return match(a:file_name, s:TestPattern()) != -1
endfunction

function s:FindImplMatches(test_file_name, extension)
  let impl_name_pattern = substitute(a:test_file_name, s:TestPattern(), '', '') . '.' . a:extension
  return s:FindMatches(g:impl_dirs, impl_name_pattern)
endfunction

function s:FindTestMatches(impl_file_name, extension)
  let test_name_pattern = substitute(a:impl_file_name, g:test_token_location, g:test_token, '') . '.' . a:extension
  return s:FindMatches(g:test_dirs, test_name_pattern)
endfunction

function s:FindMatches(search_dirs, file_name_pattern)
  return split(globpath(a:search_dirs, '**/' . a:file_name_pattern), '\n')
endfunction

function s:TestPattern()
  return substitute(g:test_token, g:test_token_location, g:test_token_location, '')
endfunction

function s:ParentDirectoryName(path)
  return fnamemodify(a:path, ':h:t')
endfunction

