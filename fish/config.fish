# Initialize Starship
set -gx PATH /opt/homebrew/bin $PATH
starship init fish | source
# Add PATH entries
set -x PATH $PATH /Users/jas/Library/Python/3.8/bin
set -x PATH /Applications/GoLand.app/Contents/MacOS '/Applications/IntelliJ IDEA.app/Contents/MacOS' $PATH

# Initialize Pyenv
status --is-interactive; and pyenv init --path | source

# Use lts for nvm
#nvm use lts

# Set AWS profile
set -x AWS_PROFILE platform-dev

# SSH Agent setup
if not set -q SSH_AGENT_PID
    and not pgrep -u $USER ssh-agent >/dev/null
    eval (ssh-agent -s)
end

# Define sshp function
function sshp
    sshpass -p dragos ssh -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null -l dragos $argv
end
#Aliases
thefuck  --alias | source
 
# Goenv setup
set -x GOENV_ROOT $HOME/.goenv
set -x PATH $GOENV_ROOT/bin $PATH
goenv init - | source
