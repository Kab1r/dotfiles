function ls
    if command -qs exa
        exa --icons $argv
    else
        command ls $argv
    end
end
