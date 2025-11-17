function cpf
    set file_to_copy $(fd . /home/dhoenisch | fzf --preview 'cat {} | head -200')

    if test -n "$file_to_copy"
        cp $file_to_copy .
    end

end
