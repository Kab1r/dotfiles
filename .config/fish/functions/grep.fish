function grep
  if command -qs rg
    rg $argv
  else
    command grep $argv
  end
end
