function cat
    if command -qs bat
        bat $argv
    else if command -qs batcat
        batcat $argv
    else
        command cat $argv
    end
end
