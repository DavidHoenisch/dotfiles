function new --argument project
    mkdir-cd $HOME/code/$project \
        && git init \
        && echo "# $project" >README.md \
        && git add README.md \
        && git commit -m 'GENESIS: let there be light'
end
