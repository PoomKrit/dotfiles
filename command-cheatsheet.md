# Command CheatSheet
## Todo-comment
The plugin highlights several annotation types by default. <br/>
These are configurable but typically include:
  TODO: General tasks or notes. <br/>
  FIX: Areas of the code that need fixing. <br/>
  HACK: Hacks or workarounds in the code. <br/>
  WARN: Warnings to pay attention to. <br/>
  PERF: Performance-related concerns. <br/>
  NOTE: General notes or remarks. <br/>
  TEST: Test-related annotations. <br/>

## TMUX key
C-Space Space   Select next layout <br/>
C-Space !       Break pane to a new window <br/>
C-Space #       List all paste buffers <br/>
C-Space $       Rename current session <br/>
C-Space &       Kill current window <br/>
C-Space '       Prompt for window index to select <br/>
C-Space (       Switch to previous session <br/>
C-Space )       Switch to next session <br/>
C-Space ,       Rename current window <br/>
C-Space .       Move the current window <br/>
C-Space /       Describe key binding <br/>
C-Space 0       Select window 0 <br/>
C-Space 1       Select window 1 <br/>
C-Space 2       Select window 2 <br/>
C-Space 3       Select window 3 <br/>
C-Space 4       Select window 4 <br/>
C-Space 5       Select window 5 <br/>
C-Space 6       Select window 6 <br/>
C-Space 7       Select window 7 <br/>
C-Space 8       Select window 8 <br/>
C-Space 9       Select window 9 <br/>
C-Space :       Prompt for a command <br/>
C-Space ;       Move to the previously active pane <br/>
C-Space =       Choose a paste buffer from a list <br/>
C-Space ?       List key bindings <br/>
C-Space C       Customize options <br/>
C-Space D       Choose and detach a client from a list <br/>
C-Space E       Spread panes out evenly <br/>
C-Space L       Switch to the last session <br/>
C-Space M       Clear the marked pane <br/>
C-Space [       Enter copy mode <br/>
C-Space ]       Paste the most recent paste buffer <br/>
C-Space c       Create a new window <br/>
C-Space d       Detach the current client <br/>
C-Space f       Search for a pane <br/>
C-Space i       Display window information <br/>
C-Space n       Select the next window <br/>
C-Space o       Select the next pane <br/>
C-Space p       Select the previous window <br/>
C-Space q       Display pane numbers <br/>
C-Space s       Choose a session from a list <br/>
C-Space t       Show a clock <br/>
C-Space w       Choose a window from a list <br/>
C-Space x       Kill the active pane <br/>
C-Space m       Zoom the active pane (origin is C-Space z) <br/>
C-Space {       Swap the active pane with the pane above <br/>
C-Space }       Swap the active pane with the pane below <br/>
C-Space ~       Show messages <br/>
C-Space DC      Reset so the visible part of the window follows the cursor <br/>
C-Space PPage   Enter copy mode and scroll up <br/>
C-Space Up      Select the pane above the active pane <br/>
C-Space Down    Select the pane below the active pane <br/>
C-Space Left    Select the pane to the left of the active pane <br/>
C-Space Right   Select the pane to the right of the active pane <br/>
C-Space M-1     Set the even-horizontal layout <br/>
C-Space M-2     Set the even-vertical layout <br/>
C-Space M-3     Set the main-horizontal layout <br/>
C-Space M-4     Set the main-vertical layout <br/>
C-Space M-5     Select the tiled layout <br/>
C-Space M-6     Set the main-horizontal-mirrored layout <br/>
C-Space M-7     Set the main-vertical-mirrored layout <br/>
C-Space M-n     Select the next window with an alert <br/>
C-Space M-o     Rotate through the panes in reverse <br/>
C-Space M-p     Select the previous window with an alert <br/>
C-Space k    Resize the pane up by 5 (Origin is C-Space M-Up) <br/>
C-Space j  Resize the pane down by 5 (Origin is C-Space M-Down) <br/>
C-Space h  Resize the pane left by 5 (Origin is C-Space M-Left) <br/>
C-Space l Resize the pane right by 5 (Origin is C-Space M-Right) <br/>
C-Space C-s  Save session state <br/>
C-Space C-o     Rotate through the panes <br/>
C-Space C-z     Suspend the current client <br/>
C-Space C-Up    Resize the pane up (duplicated with Mac shortcut) <br/>
C-Space C-Down  Resize the pane down (duplicated with Mac shortcut) <br/>
C-Space C-Left  Resize the pane left (duplicated with Mac shortcut) <br/>
C-Space C-Right Resize the pane right (duplicated with Mac shortcut) <br/>
C-Space S-Up    Move the visible part of the window up <br/>
C-Space S-Down  Move the visible part of the window down <br/>
C-Space S-Left  Move the visible part of the window left <br/>
C-Space S-Right Move the visible part of the window right <br/>

## Yazi
### Navigation
#### Move Cursor:
k or ↑: Move up <br/>
j or ↓: Move down <br/>
h or ←: Go to parent directory <br/>
l or →: Enter selected directory <br/>
Jump to Positions: <br/>
gg: Move to top <br/>
G: Move to bottom <br/>
Directory Navigation: <br/>
z: Jump to a directory using zoxide <br/>
Z: Jump to a directory or reveal a file using fzf <br/>

### Selection
#### Toggle Selection:
Space: Select or deselect highlighted item <br/>
Visual Mode: <br/>
v: Enter selection mode <br/>
V: Enter deselection mode <br/>
Select All: <br/>
Ctrl + a: Select all items <br/>
Inverse Selection: <br/>
Ctrl + r: Invert current selection <br/>
Cancel Selection: <br/>
Esc: Cancel selection <br/>

### File Operations
#### Open Files:
Enter or o: Open selected files <br/>
Shift + Enter or O: Open selected files interactively <br/>
File Information: <br/>
Tab: Display file information <br/>
Clipboard Operations: <br/>
y: Copy selected files <br/>
x: Cut selected files <br/>
p: Paste copied or cut files <br/>
P: Paste and overwrite if destination exists <br/>
Y or X: Cancel copy or cut operation <br/>
Delete Files: <br/>
d: Move selected files to trash <br/>
D: Permanently delete selected files <br/>
Create and Rename: <br/>
a: Create a new file or directory (end with / for directories) <br/>
r: Rename selected file(s) <br/>
Toggle Hidden Files: <br/>
.: Show or hide hidden files <br/>
Run Commands: <br/>
;: Execute a shell command <br/>
:: Execute a shell command and wait for completion <br/>

### Copy Paths
#### Copy Operations:
c then c: Copy file path <br/>
c then d: Copy directory path <br/>
c then f: Copy filename <br/>
c then n: Copy filename without extension <br/>

### Filtering and Searching
#### Filter Files:
f: Filter files <br/>
Find Files: <br/>
/: Find next file <br/>
?: Find previous file <br/>
n: Go to next match <br/>
N: Go to previous match <br/>
Search Files: <br/>
s: Search files by name using fd <br/>
S: Search files by content using ripgrep <br/>
Ctrl + s: Cancel ongoing search <br/>

### Sorting
#### Sort Options:
, then m: Sort by modified time <br/>
, then M: Sort by modified time (reverse) <br/>
, then b: Sort by birth time <br/>
, then B: Sort by birth time (reverse) <br/>
, then e: Sort by file extension <br/>
, then E: Sort by file extension (reverse) <br/>
, then a: Sort alphabetically <br/>
, then A: Sort alphabetically (reverse) <br/>
, then n: Sort naturally <br/>
, then N: Sort naturally (reverse) <br/>
, then s: Sort by size <br/>
, then S: Sort by size (reverse) <br/>
, then r: Sort randomly <br/>

### Miscellaneous
##### Help:
-	~ or F1: Display help screen
##### Quit:
-	q: Quit Yazi
-	Q: Quit without writing current working directory file
##### Suspend:
-	Ctrl + z: Suspend Yazi process
