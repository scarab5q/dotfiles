eval (/opt/homebrew/bin/brew shellenv)

if status is-interactive
    eval (zellij setup --generate-auto-start fish | string collect)
end

zoxide init fish | source


# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
