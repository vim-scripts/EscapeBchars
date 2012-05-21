""""""""""""""""""""""""""""""""""""""""""""""""""""
""  Plugin written and maintained by Gael Induni
"" This is EscapeBchars plugin to escape chars in b: vars
""  Last modified: Mon 21 May 2012 04:45:17 PM CEST
""  Version 0.2
""""""""""""""""""""""""""""""""""""""""""""""""""""
"" To be always up-to-date:
"" GetLatestVimScripts: 4081 1 :AutoInstall: EscapeBchars
""
if exists("g:loaded_EscapeBchars") && g:loaded_EscapeBchars == 1
	finish
endif
""
let g:loaded_EscapeBchars = 1
let g:EscapeBchars_version = 0.2
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
