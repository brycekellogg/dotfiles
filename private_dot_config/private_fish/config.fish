
# The default greeting when you start fish
# needs to be set to blank to disable.
set fish_greeting

if status is-interactive

    # Fisher is a plugin manager for fish. Here
    # we test to to see if it is already installed,
    # and if not we doanload & install it.
    # https://github.com/jorgebucaran/fisher
    if not type -sq fisher
        curl -sL https://git.io/fisher | source
        fisher install jorgebucaran/fisher
    end

    # Fisher plugins
    if not fisher list ilancosman/tide@v5 &> /dev/null
        fisher install ilancosman/tide@v5
    end

    # Commands to run in interactive sessions can go here
    alias vim='nvim'


end

# Config options for the tide prompt. These need to
# be set outside the `is-interactive` block because
# the async nature of the prompt means that they
# are evaluated outside of an interactive session.
set -g tide_left_prompt_items pwd git character
set -g tide_character_color green
set -g tide_character_color_failure red
set -g tide_git_color_branch yellow
set -g tide_pwd_color_dirs green
set -g tide_pwd_color_anchors green
set -g tide_pwd_color_truncated_dirs green
