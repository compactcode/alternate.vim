if !exists("g:source_dirs")
  let g:source_dirs = '*'
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
  return s:FindClosestAlternative(file_path, s:FindTestFiles(file_name, file_extension))
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
    return s:FindSourceFiles(file_name, file_extension)
  else
    return s:FindTestFiles(file_name, file_extension)
  endif
endfunction

function s:IsTest(file_name)
  return match(a:file_name, s:FindTestToken()) != -1
endfunction

function s:FindSourceFiles(test_file_name, extension)
  let file_name = substitute(a:test_file_name, s:FindTestToken(), '', '')
  return s:FindFiles(g:source_dirs, file_name, a:extension)
endfunction

function s:FindTestFiles(source_file_name, extension)
  let file_name = substitute(a:source_file_name, g:test_token_location, g:test_token, '')
  return s:FindFiles(g:test_dirs, file_name, a:extension)
endfunction

function s:FindFiles(search_dirs, file_name, file_extension)
  return split(globpath(a:search_dirs, '**/' . a:file_name . '.' .a:file_extension), '\n')
endfunction

function s:FindTestToken()
  return substitute(g:test_token, g:test_token_location, g:test_token_location, '')
endfunction

function s:ParentDirectoryName(path)
  return fnamemodify(a:path, ':h:t')
endfunction

