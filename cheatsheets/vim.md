# Vim useful commands and shortcuts

## Things to reguarly keep track of (if using them might be a good idea)

- Windows
- Buffers
- Tabs
- NetRw (--> no Plugin needed for Filetree)
- Jumplist
- Marks
- Quicklist (--> replaces a lot of needs for plugins // writing your own)
- Macros
- Registers
- Regex
- Builtin completion (line, tags, omnicomplete)

## clipboard
vim-gtk enables clipboard

## vim useful commands
| command    | description |
| :-------------- | :----------- |
| :only | closes all other windows |
| :-1read | inserts content of file at cursor |
| :!cat % | cats out the current file to stdin for easy clipboard copying |
| :<ctrl+d> | show a list of all available commands/files/buffers/dirs |
| :marks | shows a list of all set marks |
| :reg | shows all registers |

## vim autocompletion
| command    | description |
| :-------------- | :----------- |
| ctrl+x | triggers autocompletion context |
| ctrl+n | next autocompletion |
| ctrl+p | previous autocompletion |
| ctrl+x -> ctrl+] | tag autocompletion |
| ctrl+x -> ctrl+o | omnifunction autocompletion |
| ctrl+x -> ctrl+l | line autocompletion |
| ctrl+x -> ctrl+i | include autocompletion |
| (in visual mode) = | will auto indent code |

## vim registers
| command    | description |
| :-------------- | :----------- |
| "a | register to 'a' command (can chain with copy, delete) |

## vim window management
| command    | description |
| :-------------- | :----------- |
| ctrl+w+= | rearrange /autosize windows |
| ctrl+w+L | move window to the right |

## vim editing / jumping
| ctrl+r | triggers Register |
| . | will repeat the last action under cursor |
| ci( | delete and insert within next bracket |
| A | insert at end of line |
| a | insert after cursor |
| i | insert at cursor |
| I | insert at beginning of line |
| c | delete and insert |
| C | delete whole line and insert |
| r | replace at cursor (one char) |
| R | replace and overwrite (multiple chars) |
| o | add newline and insert after cursor line |
| O | add newline and insert before cursor line |
| s | delete (like x) and insert at cursor |
| S | delete whole line and insert (respecting indendation) |
| qa | record macro @ a |
| q | stop recording macro |
| @a | do macro @ a |
| gf | jump to file under cursor |
| ctrl+] | jump to tag definition |
| ctrl+o | out (previous) jump |
| ctrl+p | inside (next) jump |
| ma // mA | marks line to local a or global A |
| 'a // 'A | jumps to local a or global A (can use <backtick> too) |
| 0 | jump beginning of line |
| _ | jump beginning of line (no whitespace) |
| f | jump to |
| f | jump backwards to |
| t | jump before |
| T | jump backwards before |
| $ | jump end of line |
| % | jump to pair |
