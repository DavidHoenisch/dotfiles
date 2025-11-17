status is-login; and begin
end

status is-interactive; and begin
    # Aliases
    alias cat bat
    alias cd z
    alias du dust
    alias find fd

    # GIT Aliases
    alias ga 'git add'
    alias gc 'git commit -m'
    alias gd 'git diff'
    alias gl 'git log --oneline --graph --all'
    alias gp 'git push'
    alias gs 'git status'
    alias gch 'git rev-parse HEAD'

    alias grep rg
    alias hack 'echo '\''Initializing cyberpunk matrix...'\'' && cmatrix -C magenta'
    alias hms 'home-manager switch'
    alias j z
    alias ls 'eza -lh --group-directories-first --icons=auto'
    alias la 'eza --long --all --git --icons'
    alias ll 'eza --long --git --icons'
    alias lz lazygit
    alias ld lazydocker
    alias ts tailscale
    alias tusro '$HOME/.turso/turso'
    alias hx helix

    # TMUX aliases
    alias tks 'tmux kill-server'
    alias tls 'tmux list-sessions'
    alias tm tmuxifier

    # Minikube aliases
    alias mk minikube
    alias mkc 'minikube kubectl -- config view'

    alias asr 'atuin script run'
    alias chat 'aichat -e'
    alias ps procs
    alias top btop
    alias tree 'eza --tree --icons'
    alias yy yazi
    alias mp multipass
    alias zz zellij
    alias n nvim
    alias task go-task

    # NVIM aliases
    alias conf "nvim ~/.config/nvim"
    alias tm tmuxifier

    # jj alias
    alias jjnew 'jj tag l | fzf | cut -d " " -f2 | xargs jj new'
    alias jjnuke 'jj tag l | fzf | cut -d " " -f2 | xargs jj abandon'

    starship init fish | source

    zoxide init fish | source

    fzf --fish | source

    atuin init fish | source

    set fish_greeting

    set -gx EDITOR helix
    set -gx BROWSER chromium

    # Add custom paths (e.g., for user binaries)
    fish_add_path $HOME/.local/bin/custom
    fish_add_path $HOME/.local/bin/
    fish_add_path $HOME/go/bin/
    fish_add_path $HOME/.pdtm/go/bin/
    fish_add_path $HOME/.cargo/bin/
    fish_add_path $HOME/.fly/bin

    set -gx PATH "$FLYCTL_INSTALL/bin" $PATH
    set -gx FLYCTL_INSTALL "/home/dhoenisch/.fly"

    set -gx PATH "/home/dhoenisch/.tmuxifier/bin" $PATH
    eval (tmuxifier init - fish)
    set -gx FISH_CYBERPUNK_MODE 1

    ## go shizz
    set -gx GOPRIVATE "github.com/EpykLab/*"

    set -gx SSH_AUTH_SOCK $HOME/.1password/agent.sock

    begin
        set -l joined (string join " " $fish_complete_path)
        set -l prev_joined (string replace --regex "[^\s]*generated_completions.*" "" $joined)
        set -l post_joined (string replace $prev_joined "" $joined)
        set -l prev (string split " " (string trim $prev_joined))
        set -l post (string split " " (string trim $post_joined))
        set fish_complete_path $prev "/home/dhoenisch/.local/share/fish/home-manager_generated_completions" $post
    end

end
set -q KREW_ROOT; and set -gx PATH $PATH $KREW_ROOT/.krew/bin; or set -gx PATH $PATH $HOME/.krew/bin

# carapace configs
set -Ux CARAPACE_BRIDGES 'zsh,fish,bash,inshellisence'
carapace _carapace | source

# Generated for pdtm. Do not edit.
fish_add_path /home/dhoenisch/.pdtm/go/bin
test -f ~/.kubectl_aliases.fish && source ~/.kubectl_aliases.fish
# opencode
fish_add_path /home/dhoenisch/.opencode/bin
cat ~/.secrets.fish | source

direnv hook fish | source

# pnpm
set -gx PNPM_HOME "/home/dhoenisch/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
    set -gx PATH "$PNPM_HOME" $PATH
end
# pnpm end

# IntelliShell
set -gx INTELLI_HOME "/home/dhoenisch/.local/share/intelli-shell"
# set -gx INTELLI_SEARCH_HOTKEY ctrl-space
# set -gx INTELLI_VARIABLE_HOTKEY ctrl-l
# set -gx INTELLI_BOOKMARK_HOTKEY ctrl-b
# set -gx INTELLI_FIX_HOTKEY ctrl-x
# set -gx INTELLI_SKIP_ESC_BIND 0
# alias is="intelli-shell"
fish_add_path "$INTELLI_HOME/bin"
intelli-shell init fish | source

# Added by Radicle.
export PATH="$PATH:/home/dhoenisch/.radicle/bin"

mise activate fish | source
