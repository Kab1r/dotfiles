function ls
    if command -qs exa
        exa $argv
    else
        command ls $argv
    end
end
