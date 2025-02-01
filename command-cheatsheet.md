# Command CheatSheet
## Todo-comment
The plugin highlights several annotation types by default.  
These are configurable but typically include:
| Command | Description |
| -------------- | --------------- |
| TODO | General tasks or notes. |
| FIX | Areas of the code that need fixing. |
| HACK | Hacks or workarounds in the code. |
| WARN | Warnings to pay attention to. |
| PERF | Performance-related concerns. |
| NOTE | General notes or remarks. |
| TEST | Test-related annotations. |

## TMUX key
| Key | Output |
| -------------- | --------------- |
| C-Space Space   | Select next layout |
| C-Space !       | Break pane to a new window |
| C-Space #       | List all paste buffers |
| C-Space $       | Rename current session |
| C-Space &       | Kill current window |
| C-Space '       | Prompt for window index to select |
| C-Space (       | Switch to previous session |
| C-Space )       | Switch to next session |
| C-Space ,       | Rename current window |
| C-Space .       | Move the current window |
| C-Space /       | Describe key binding |
| C-Space 0       | Select window 0 |
| C-Space 1       | Select window 1 |
| C-Space 2       | Select window 2 |
| C-Space 3       | Select window 3 |
| C-Space 4       | Select window 4 |
| C-Space 5       | Select window 5 |
| C-Space 6       | Select window 6 |
| C-Space 7       | Select window 7 |
| C-Space 8       | Select window 8 |
| C-Space 9       | Select window 9 |
| C-Space :       | Prompt for a command |
| C-Space ;       | Move to the previously active pane |
| C-Space =       | Choose a paste buffer from a list |
| C-Space ?       | List key bindings |
| C-Space C       | Customize options |
| C-Space D       | Choose and detach a client from a list |
| C-Space E       | Spread panes out evenly |
| C-Space L       | Switch to the last session |
| C-Space M       | Clear the marked pane |
| C-Space [       | Enter copy mode |
| C-Space ]       | Paste the most recent paste buffer |
| C-Space c       | Create a new window |
| C-Space d       | Detach the current client |
| C-Space f       | Search for a pane |
| C-Space i       | Display window information |
| C-Space n       | Select the next window |
| C-Space o       | Select the next pane |
| C-Space p       | Select the previous window |
| C-Space q       | Display pane numbers |
| C-Space s       | Choose a session from a list |
| C-Space t       | Show a clock |
| C-Space w       | Choose a window from a list |
| C-Space x       | Kill the active pane |
| C-Space m       | Zoom the active pane (origin is C-Space z) |
| C-Space {       | Swap the active pane with the pane above |
| C-Space }       | Swap the active pane with the pane below |
| C-Space ~       | Show messages |
| C-Space DC      | Reset so the visible part of the window follows the cursor |
| C-Space PPage   | Enter copy mode and scroll up |
| C-Space Up      | Select the pane above the active pane |
| C-Space Down    | Select the pane below the active pane |
| C-Space Left    | Select the pane to the left of the active pane |
| C-Space Right   | Select the pane to the right of the active pane |
| C-Space M-1     | Set the even-horizontal layout |
| C-Space M-2     | Set the even-vertical layout |
| C-Space M-3     | Set the main-horizontal layout |
| C-Space M-4     | Set the main-vertical layout |
| C-Space M-5     | Select the tiled layout |
| C-Space M-6     | Set the main-horizontal-mirrored layout |
| C-Space M-7     | Set the main-vertical-mirrored layout |
| C-Space M-n     | Select the next window with an alert |
| C-Space M-o     | Rotate through the panes in reverse |
| C-Space M-p     | Select the previous window with an alert |
| C-Space k       | Resize the pane up by 5 (Origin is C-Space M-Up) |
| C-Space j       | Resize the pane down by 5 (Origin is C-Space M-Down) |
| C-Space h       | Resize the pane left by 5 (Origin is C-Space M-Left) |
| C-Space l       | Resize the pane right by 5 (Origin is C-Space M-Right) |
| C-Space C-s     | Save session state |
| C-Space C-o     | Rotate through the panes |
| C-Space C-z     | Suspend the current client |
| C-Space C-Up    | Resize the pane up (duplicated with Mac shortcut) |
| C-Space C-Down  | Resize the pane down (duplicated with Mac shortcut) |
| C-Space C-Left  | Resize the pane left (duplicated with Mac shortcut) |
| C-Space C-Right | Resize the pane right (duplicated with Mac shortcut) |
| C-Space S-Up    | Move the visible part of the window up |
| C-Space S-Down  | Move the visible part of the window down |
| C-Space S-Left  | Move the visible part of the window left |
| C-Space S-Right | Move the visible part of the window right |

## Yazi
### Navigation
#### Move Cursor:
| Key | Result |
| -------------- | --------------- |
| k or ↑ | Move up |
| j or ↓ | Move down |
| h or ← | Go to parent directory |
| l or → | Enter selected directory |
#### Jump to Positions: 
| Key | Result |
| -------------- | --------------- |
| gg | Move to top |
| G | Move to bottom |
#### Directory Navigation: 
| Key | Result |
| -------------- | --------------- |
| z |Jump to a directory using zoxide |
| Z |Jump to a directory or reveal a file using fzf |

### Selection
#### Toggle Selection:
| Key | Result |
| -------------- | --------------- |
| Space | Select or deselect highlighted item |
#### Visual Mode: 
| Key | Result |
| -------------- | --------------- |
| v |Enter selection mode |
| V |Enter deselection mode |
#### Select All: 
| Key | Result |
| -------------- | --------------- |
| Ctrl + a | Select all items |
#### Inverse Selection: 
| Key | Result |
| -------------- | --------------- |
| Ctrl + r | Invert current selection |
#### Cancel Selection: 
| Key | Result |
| -------------- | --------------- |
| Esc | Cancel selection |

### File Operations
#### Open Files:
| Key | Result |
| -------------- | --------------- |
| Enter or o| Open selected files |
| Shift + Enter or O| Open selected files interactively |
#### File Information: 
| Key | Result |
| -------------- | --------------- |
| Tab| Display file information |
#### Clipboard Operations: 
| Key | Result |
| -------------- | --------------- |
| y| Copy selected files |
| x| Cut selected files |
| p| Paste copied or cut files |
| P| Paste and overwrite if destination exists |
| Y or X| Cancel copy or cut operation |
#### Delete Files: 
| Key | Result |
| -------------- | --------------- |
| d| Move selected files to trash |
| D| Permanently delete selected files |
#### Create and Rename: 
| Key | Result |
| -------------- | --------------- |
| a| Create a new file or directory (end with / for directories) |
| r| Rename selected file(s) |
#### Toggle Hidden Files: 
| Key | Result |
| -------------- | --------------- |
| .| Show or hide hidden files |
#### Run Commands: 
| Key | Result |
| -------------- | --------------- |
| ;| Execute a shell command |
| :| Execute a shell command and wait for completion |

### Copy Paths
#### Copy Operations:
| Key | Result |
| -------------- | --------------- |
| c then c| Copy file path |
| c then d| Copy directory path |
| c then f| Copy filename |
| c then n| Copy filename without extension |

### Filtering and Searching
#### Filter Files:
| Key | Result |
| -------------- | --------------- |
| f| Filter files |
#### Find Files: 
| Key | Result |
| -------------- | --------------- |
| /| Find next file |
| ?| Find previous file |
| n| Go to next match |
| N| Go to previous match |
#### Search Files: 
| Key | Result |
| -------------- | --------------- |
| s| Search files by name using fd |
| S| Search files by content using ripgrep |
| Ctrl + s| Cancel ongoing search |

### Sorting
#### Sort Options:
| Key | Result |
| -------------- | --------------- |
| , then m| Sort by modified time |
| , then M| Sort by modified time (reverse) |
| , then b| Sort by birth time |
| , then B| Sort by birth time (reverse) |
| , then e| Sort by file extension |
| , then E| Sort by file extension (reverse) |
| , then a| Sort alphabetically |
| , then A| Sort alphabetically (reverse) |
| , then n| Sort naturally |
| , then N| Sort naturally (reverse) |
| , then s| Sort by size |
| , then S| Sort by size (reverse) |
| , then r| Sort randomly |

### Miscellaneous
#### Help:
| Key | Result |
| -------------- | --------------- |
|~ or F1 | Display help screen |
#### Quit:
| Key | Result |
| -------------- | --------------- |
|q| Quit Yazi|
|Q| Quit without writing current working directory file|
#### Suspend:
| Key | Result |
| -------------- | --------------- |
|Ctrl + z| Suspend Yazi process|

