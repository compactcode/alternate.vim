function Alternate()
  execute "edit " . FindAlternate()
endfunction

function FindAlternate()
  let current_file_name = expand("%:t:r")
  let current_file_extension = expand("%:e")
  if IsRuby(current_file_extension)
    if IsTest(current_file_name)
      return FindImplementation(current_file_name)
    else
      return FindTest(current_file_name)
    endif
  endif
endfunction

function IsRuby(file_extension)
  return match(a:file_extension, 'rb') != -1
endfunction

function IsTest(file_name)
  return match(a:file_name, '_spec$') != -1
endfunction

function FindImplementation(file_name)
  return FindFirstMatch("**/" . substitute(a:file_name, '_spec', '', '') .".rb")
endfunction

function FindTest(file_name)
  return FindFirstMatch("spec/**/" . a:file_name . "_spec.rb")
endfunction

function FindFirstMatch(pattern)
  let matches = split(glob(a:pattern), "\n")
  if len(matches) > 0
    return get(matches, 0)
  endif
endfunction

