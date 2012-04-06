" =============================================================================
" Public Interface
" =============================================================================

function alternate#FindAlternate()
  if exists('b:alternate_enabled')
    return s:FindAlternate()
  else
    echom "Alternate not enabled for this file type."
  end
endfunction

function alternate#FindTest()
  if exists('b:alternate_enabled')
    return s:FindTest()
  else
    echom "Alternate not enabled for this file type."
  end
endfunction

" =============================================================================
" Private Interface
" =============================================================================

function s:FindAlternate()
  let file_path = expand('%')
  return s:ChooseAlternateFile(file_path, s:FindAlternateFiles())
endfunction

function s:FindTest()
  let file_path = expand('%')
  let file_name = expand('%:t:r:r')
  if s:IsTest(file_name)
    return file_path
  endif
  let file_extension = expand('%:e:e')
  return s:ChooseAlternateFile(file_path, s:FindTestFiles(file_name, file_extension))
endfunction

function s:ChooseAlternateFile(current_path, alternative_paths)
  " If there are multiple matches, look for one with the same parent directory.
  if len(a:alternative_paths) > 1
    for alternate_path in a:alternative_paths
      if s:ParentDirectoryName(a:current_path) == s:ParentDirectoryName(alternate_path)
        return alternate_path
      endif
    endfor
  endif

  " Otherise, always pick the first match.
  return get(a:alternative_paths, 0)
endfunction

function s:FindAlternateFiles()
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
  return s:FindFiles(b:alternate_source_dirs, file_name, a:extension)
endfunction

function s:FindTestFiles(source_file_name, extension)
  let file_name = substitute(a:source_file_name, b:alternate_test_token_location, b:alternate_test_token, '')
  return s:FindFiles(b:alternate_test_dirs, file_name, a:extension)
endfunction

function s:FindFiles(search_dirs, file_name, file_extension)
  return split(globpath(a:search_dirs, '**/' . a:file_name . '.' .a:file_extension), '\n')
endfunction

function s:FindTestToken()
  return substitute(b:alternate_test_token, b:alternate_test_token_location, b:alternate_test_token_location, '')
endfunction

function s:ParentDirectoryName(path)
  return fnamemodify(a:path, ':h:t')
endfunction

