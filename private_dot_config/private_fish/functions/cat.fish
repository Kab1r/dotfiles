function cat
    if command -qs bat
        bat $argv
    else if command -qs catbat
        catbat $argv
    else
        command cat $argv
    end
end
