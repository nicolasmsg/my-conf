
# remap prefix to Control + a
set -g prefix C-a
unbind C-b
bind C-a send-prefix

# force a reload of the config file
bind-key R source-file ~/.tmux.conf \; display-message "tmux.conf reloaded."

# Easy-to-remember split pane commands
bind \ split-window -h -c '#{pane_current_path}' # vertical pane
bind - split-window -v -c '#{pane_current_path}' # horizontal pane

# tmux messages are displayed for 3 seconds
set -g display-time 3000

# upgrade $TERM
set -g default-terminal "xterm-256color"

# Activate the mouse
set -g mouse on

# increase scrollback buffer size
set -g history-limit 50000

# move around panes with hjkl, as one would in vim after pressing ctrl-w
bind-key h select-pane -L
bind-key j select-pane -D
bind-key k select-pane -U
bind-key l select-pane -R

# Copy-paste integration
setw -g mode-keys vi

bind-key -T copy-mode-vi WheelUpPane send -X scroll-up
bind-key -T copy-mode-vi WheelDownPane send -X scroll-down

bind-key -T copy-mode-vi y send-keys -X copy-pipe-and-cancel "reattach-to-user-namespace pbcopy"
bind-key -T copy-mode-vi MouseDragEnd1Pane send-keys -X copy-pipe-and-cancel "reattach-to-user-namespace pbcopy" \; display-message "highlighted selection copied to system clipboard"

# Status bar ------------------------------------------------------------- 
# set-option -g status on
set-option -g set-titles on
set -g status-interval 1
set-option -g update-environment "SSH_ASKPASS SSH_AUTH_SOCK SSH_AGENT_PID SSH_CONNECTION DISPLAY"

set -g status-position bottom
set -g status-bg colour237
set -g status-fg colour137
set -g status-attr dim
set -g status-left '#[fg=colour197] #(~/bin/internet_info.sh) #(~/bin/env_version.sh)'

# set -g status-right '#[fg=colour81]♪ #(~/bin/now_playing.sh) #(~/bin/battery.sh) #[fg=colour255,bg=colour241,bold] %a %m-%d #[fg=colour255,bg=colour241,bold] %H:%M:%S #[fg=colour165]#[bg=default] #H '
set -g status-right '#[fg=colour81] #(~/bin/battery.sh) #[fg=colour255,bg=colour241,bold] %a %m-%d #[fg=colour255,bg=colour241,bold] %H:%M:%S #[fg=colour165]#[bg=default] #H '

set -g status-right-length 100
set -g status-left-length 70

set-window-option -g aggressive-resize
setw -g window-status-current-fg colour170
setw -g window-status-current-bg colour239
setw -g window-status-current-attr bold
setw -g window-status-current-format ' #I#[fg=colour250]:#[fg=colour255]#W#[fg=colour170]#F '

set-option -g set-titles-string 'Tmux | #W'
setw -g window-status-current-fg colour170
setw -g window-status-current-attr bold
setw -g window-status-current-format ' #I#[fg=colour250]:#[fg=colour255]#W#[fg=colour170]#F '


