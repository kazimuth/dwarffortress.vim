" The raw file format is fairly awful, but it does have a prescribed header we
" can check for.

au BufNewFile,BufRead *.txt
    \  if g:dwarffortress_always 
    \|   set ft=dwarffortress
    \| elseif g:dwarffortress_guess
    \|   call s:DwarfFortressDetect()
    \| endif

function s:DwarfFortressDetect()
    " raw.txt contents:
    " raw
    " This is a raw file.
    " [OBJECT:SOMETHING]
    " ...
    "
    let l:contents = readfile(expand(@%))
    let l:stem = expand('%:t:r')

    let l:raw       = getline(1) =~? '\V'.l:stem
                \ && match(l:contents, '\V\c[\s\*OBJECT\s\*:') != -1
    let l:init      = l:stem ==? 'init' 
                \ && match(l:contents, '\V\c[\s\*\(SOUND\|WINDOWEDX\|VSYNC\)\s\*:') != -1
    let l:d_init    = l:stem ==? 'd_init'
                \ && match(l:contents, '\V\c[\s\*AUTOBACKUP\s\*:') != -1
    let l:world_gen = l:stem ==? 'world_gen'
                \ && match(l:contents, '\V\c[\s\*WORLD_GEN\s\*]') != -1
    let l:colors    = l:stem ==? 'colors'
                \ && match(l:contents, '\V\c[\s\*BLACK_R\s\*:') != -1
    let l:announce  = l:stem ==? 'announcements'
                \ && match(l:contents, '\V\c[\s\*REACHED_PEAK\s\*:') != -1
    let l:interface = l:stem ==? 'interface'
                \ && match(l:contents, '\V\c[\s\*BIND\s\*:') != -1

    if l:raw || l:init || l:d_init || l:world_gen || l:colors || l:announce || l:interface
        set ft=dwarffortress
    endif
endfunction
