function halo
    set PROJECT_DIR ~/code

    if not test -d "$PROJECT_DIR"
        echo "Directory $PROJECT_DIR does not exist."
        return 1
    end

    set SELECTED_PATH (fd --type d --max-depth 1 . "$PROJECT_DIR" | fzf --preview 'tre {} | head -200')

    if test -n "$SELECTED_PATH"
        cd "$SELECTED_PATH"

        helix .
    end
end
