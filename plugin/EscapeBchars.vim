""""""""""""""""""""""""""""""""""""""""""""""""""""
""  Plugin written and maintained by Gael Induni
"" This is EscapeBchars plugin to escape chars in b: vars
""  Last modified: Thu 10 May 2012 04:31:06 PM CEST
""  Version 0.1
""""""""""""""""""""""""""""""""""""""""""""""""""""
""
if exists("g:loaded_EscapeBchars") && g:loaded_EscapeBchars == 1
	finish
endif
""
let g:loaded_EscapeBchars = 1
let g:EscapeBchars_version = 0.1
""
function EscapeBchars( char, ... )
	let l:ComEsc = a:char
	let l:ComEsc = substitute( l:ComEsc, "\"", "\\\\\"", "g" )
	let l:ComEsc = substitute( l:ComEsc, "\/", "\\\\/", "g" )
	let l:ComEsc = substitute( l:ComEsc, "\*", "\\\\*", "g" )
	if a:0 > 0 && a:1 != ""
		let l:MoreEsc = a:1
		let l:MoreEsc = substitute( l:MoreEsc, "\"", "\\\\\"", "g" )
		let l:MoreEsc = substitute( l:MoreEsc, "\/", "\\\\/", "g" )
		let l:MoreEsc = substitute( l:MoreEsc, "\*", "\\\\*", "g" )
		if a:0 == 1 || ( a:0 > 1 && a:2 > 0 )
			let l:ComEsc = l:ComEsc . l:MoreEsc . "*"
		else
			let l:ComEsc = l:MoreEsc . "*" . l:ComEsc
		endif
	endif
	return l:ComEsc
endfunction
