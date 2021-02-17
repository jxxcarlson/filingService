# Editor

@blue[A start on a manual for the editor.]

## Key commands

### Cursor motion

- Unmodified **arrow keys** work 
as expected, moving the 
cursor a character or line at a time.  

- Option-arrowKey makes larger moves: to the 
beginning or end of the line, up or down one "page,"
where one page is arbitrarily defined as 20 lines.
 @blue[Page up, page down need more work.]

- **ctrl-A** moves to the start of the line, **ctrl-E**
to the end.

### Selection

- Double-click selects a word, triple-click selects 
a line

- Shift-arrowKey extends the selection.
- TAB indents the selection, while shift-TAB 
de-indents it.

### Editing

- **ctrl-D** deletes the curent character, while 
DELETE erases the previous character.

- **ctrl-K** kills the current line from the cursor 
forward. **ctrl-U** kills the current line.

### Niceties

- **ctrl-W** wraps the current selection.

## Command execution

In standad edit mode, type ESC, the command, and 
ESC.  Typical commands are for LaTeX:

- `$`, which constructs valid inline math text, `$\pi$`
- `$$` — valid display math text
- `th` — valid theorem environment
- `eq` — valid equation environment
environment

## Vim mode

This work is just beginning.

- **option-V** to enter or leave Vim mode
- Type "i" to enter insert mode, ESC to leave it.
- While in Vim mode, use "= COMMAND =" for command 
exection

