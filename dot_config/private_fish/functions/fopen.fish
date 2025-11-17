function fopen
    set file $(fd . $HOME | fzf --preview='cat {}')

    if test -n $file
        helix $file
    end
end
