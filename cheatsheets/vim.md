# Vim useful commands and shortcuts

##
vim-gtk enables clipboard

## vim useful commands
| command    | description |
| :-------------- | :----------- |
| :only | closes all other windows |
| :-1read | inserts content of file at cursor |

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

## vim jumps / navigation / marks
| command    | description |
| :-------------- | :----------- |
| gf | jump to file under cursor |
| ctrl+] | jump to tag definition |
| ctrl+o | out (previous) jump |
| ctrl+p | inside (next) jump |
| ma // mA | marks line to local a or global A |
| 'a // 'A | jumps to local a or global A (can use <backtick> too) |

## vim window management
| command    | description |
| :-------------- | :----------- |
| ctrl+w+= | rearrange /autosize windows |
| ctrl+w+L | move window to the right |

## vim commandline
| command    | description |
| :-------------- | :----------- |
| :<ctrl+d> | show a list of all available commands/files/buffers/dirs |
| :marks | shows a list of all set marks |
| :reg | shows all registers |

## vim editing / registers
| ctrl+r | triggers Register |
| "a | register to 'a' command (can chain with copy, delete) |
| . | will repeat the last action under cursor |
| ci( | delete and insert within next bracket |
