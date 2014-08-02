function! ShouldWeDisplayTheBuffer(buffer_number)
  let buf_type = getbufvar(a:buffer_number, "&filetype")
  return a:buffer_number != 0 && bufexists(a:buffer_number) &&
    \ buf_type != 'help' && buf_type != 'qf'
endfunction

function! GetNextBuffer(curr, incr)
  let new  = a:curr + a:incr
  let last = bufnr("$")
  if new < 1
    return last
  elseif new > last
    return 1
  else
    return new
  endif
endfunction


function! SwitchToNextBuffer(incr)
  let help_buffer = (&filetype == 'help')
  let current = bufnr("%")
  let new = GetNextBuffer(current, a:incr)
  while 1
    if ShouldWeDisplayTheBuffer(new)
      execute ":buffer ".new
      break
    else
      let new = GetNextBuffer(new, a:incr)
      if new == current
        break
      endif
    endif
  endwhile
endfunction
