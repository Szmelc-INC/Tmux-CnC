# Tmux-CnC
Command &amp; Control interface for tmux

### Available aliases
- `stop ID` - Stop currently running process [Ctrl + C]
- `terminate ID` - Terminate currently running process [Ctrl + Z]
- `pause ID` - Pause process [Ctrl + S]
- `unpause ID` - Unpause process [Ctrl + Q]
- `send ID 'command'` - Pass command directly to a pane
- `focus ID` - Focus on a pane
- `split ID h/v [Percent]` - Split pane
- `close ID` - Close pane
- `upload ID /path/to/file` - Upload file to a remote client
- `download ID /path/to/file` - Download file from remote client
- `run ID /path/to/script` - Run local script in a pane
- `res up|down|left|right [size]` - Resize current pane

> Variable `ID` is pane ID, \
> `ALL` can also be used to execute on all panes except currently active. \
> Split pane h = horizontally | v = vertically.
