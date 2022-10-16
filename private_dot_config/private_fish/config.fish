
# The default greeting when you start fish
# needs to be set to blank to disable.
set fish_greeting

if status is-interactive

    set -l DIRCOLORS_FILE "$HOME/.config/dircolors/solarized-dircolors.256dark"
    set -q XDG_CONFIG_HOME && set -l DIRCOLORS_FILE "$XDG_CONFIG_HOME/dircolors/solarized-dircolors.256dark"
    eval (dircolors -c $DIRCOLORS_FILE)

    # Aliases
    alias vim='nvim'
    alias ll='exa -l --group-directories-first'
    alias ls='exa --group-directories-first'
    alias la='exa -la --group-directories-first'

    set -g EDITOR nvim

    set -x SSH_AUTH_SOCK /run/user/(id -u)/gnupg/S.gpg-agent.ssh
end


# Config options for the tide prompt. These need to
# be set outside the `is-interactive` block because
# the async nature of the prompt means that they
# are evaluated outside of an interactive session.
set -g tide_left_prompt_items pwd git character
set -g tide_character_color green
set -g tide_character_color_failure red
set -g tide_git_color_branch yellow
set -g tide_pwd_color_dirs 859900
set -g tide_pwd_color_anchors 859900
set -g tide_pwd_color_truncated_dirs 859900
