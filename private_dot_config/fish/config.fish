
# The default greeting when you start fish
# needs to be set to blank to disable.
set fish_greeting

if status is-interactive

    # In interactive mode, we set the
    # default shell to be fish. This allows
    # us to have tmux default to the shell
    # that launched it independent of the
    # true default shell.
    set -x SHELL (status fish-path)

    # We try to install as much as possible without
    # needing root access by using this path.
    fish_add_path --path $HOME/.local/bin

    # Set the LS_COLORS & EXA_COLORS environment variables
    set -l LSCOLORS_JSON  "$HOME/.config/dircolors/lscolors.jsonc"
    set -l EXACOLORS_JSON "$HOME/.config/dircolors/exacolors.jsonc"
    set -l DIRCOLORS_JQ   "$HOME/.config/dircolors/dircolors.jq"
    set -x LS_COLORS  (sed 's/^ *\/\/.*//' $LSCOLORS_JSON  | jq -r -f $DIRCOLORS_JQ)
    set -x EXA_COLORS (sed 's/^ *\/\/.*//' $EXACOLORS_JSON | jq -r -f $DIRCOLORS_JQ)

    # Always use neovim
    alias vim='nvim'

    # Use exa as ls if it's installed
    if type -q exa
        alias ll='exa -l --group-directories-first'
        alias ls='exa --group-directories-first'
        alias la='exa -la --group-directories-first'
        alias tree='exa -T'
    end

    # Ubuntu calls fd "fdfind"
    if type -q fdfind
        alias fd='fdfind'
    end

    set -gx EDITOR nvim
    set -gx VISUAL nvim

    # When using WSL, some binaries need to be stored
    # in a Windows path for speed issues. This
    # adds that directory to the path if it exists.
    #
    # Note: we assume that the windows username is the same
    # as the Linux username for speed pursposes.
    fish_add_path --path /mnt/c/Users/$USER/wsl-bin/
end


# Config options for the tide prompt. These need to
# be set outside the `is-interactive` block because
# the async nature of the prompt means that they
# are evaluated outside of an interactive session.
set -g tide_left_prompt_items  pwd git character
set -g tide_right_prompt_items status cmd_duration context jobs virtual_env
set -g tide_prompt_add_newline_before  false
set -g tide_character_color green
set -g tide_character_color_failure red
set -g tide_git_color_branch yellow
set -g tide_pwd_color_dirs 859900
set -g tide_pwd_color_anchors 859900
set -g tide_pwd_color_truncated_dirs 859900
