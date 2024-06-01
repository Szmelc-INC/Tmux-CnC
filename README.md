# Tmux-CnC
![2024-06-0114-29-59-ezgif com-speed](https://github.com/GNU-Szmelc/Tmux-CnC/assets/95081005/05798a8b-78f5-492a-a077-6b94125d7317)


Command &amp; Control interface for tmux. \
Has few handy aliases to make using tmux easier

### Available aliases
- `stop ID` - Stop currently running process [Ctrl + C]
- `terminate ID` - Terminate currently running process [Ctrl + Z]
- `pause ID` - Pause process [Ctrl + S]
- `unpause ID` - Unpause process [Ctrl + Q]
- `res up|down|left|right [size]` - Resize current pane
- `split ID h/v [Percent]` - Split pane
- `close ID` - Close pane
- `focus ID` - Focus on a pane
- `send ID 'command'` - Pass command directly to a pane
- `upload ID /path/to/file` - Upload file to a remote client
- `download ID /path/to/file` - Download file from remote client
- `run ID /path/to/script` - Run local script in a pane

> Variable `ID` is pane ID, \
> `ALL` can also be used to execute on all panes except currently active. \
> Split pane h = horizontally | v = vertically.

### Extras
> There is demo script using xdotool available, just start `tmuxcnc.sh` then from there start `demo.sh` and enjoy the show
