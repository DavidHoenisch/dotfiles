function copy-file
    if test (count $argv) -eq 0
        echo "Usage: copy-file <filename>"
        return 1
    end
    wl-copy < $argv[1]
end