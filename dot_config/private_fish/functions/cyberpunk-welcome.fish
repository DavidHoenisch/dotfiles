function cyberpunk-welcome
    set -l neon_colors magenta cyan green
    set -l random_color (random choice $neon_colors)
    echo -e "\e[1;35mWelcome to the Neon Grid, $USER!\e[0m"
    echo -e "\e[0;36mSystem ready. Hack the planet!\e[0m"
end
