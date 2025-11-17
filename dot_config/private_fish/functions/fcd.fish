# Fish shell function to fuzzy-find a directory (recursively) and cd into it

function fcd
    # 1. Use fd to find directories recursively from the current location
    # --type d: find directories
    # --hidden: include hidden directories (like .config)
    # --exclude .git: common exclusion to speed up search
    # '.': search from the current directory
    set SELECTED_PATH (fd --type d --hidden --exclude .git . --full-path /home/dhoenisch | fzf --preview 'tre {} | head -200')

    # 2. Check if a selection was made (fzf didn't exit with ESC)
    if test -n "$SELECTED_PATH"
        # 3. Change directory in the *current* shell
        cd "$SELECTED_PATH"
    end
end
