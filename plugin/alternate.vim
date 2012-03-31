function Alternate()
  execute "edit " . FindAlternate()
endfunction

function FindAlternate()
  let current_file_name = expand("%:t:r")
  let current_file_extension = expand("%:e")
  if s:IsRuby(current_file_extension)
    if s:IsTest(current_file_name)
      return s:FindImplementation(current_file_name)
    else
      return s:FindTest(current_file_name)
    endif
  endif
endfunction

function s:IsRuby(file_extension)
  return match(a:file_extension, 'rb') != -1
endfunction

function s:IsTest(file_name)
  return match(a:file_name, '_spec$') != -1
endfunction

function s:FindImplementation(file_name)
  return s:FindFirstMatch("**/" . substitute(a:file_name, '_spec', '', '') .".rb")
endfunction

function s:FindTest(file_name)
  return s:FindFirstMatch("spec/**/" . a:file_name . "_spec.rb")
endfunction

function s:FindFirstMatch(pattern)
  let matches = split(glob(a:pattern), "\n")
  if len(matches) > 0
    return get(matches, 0)
  endif
endfunction

