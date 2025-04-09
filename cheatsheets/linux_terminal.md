# linux (ubuntu) terminal cheatsheet

Hint: use ` man command ` or ` command --help ` or ` command -h ` to get verbose information

## useful third-party tools
| tool    | description |
| :---    | :---------- |
| cmatrix | activates matrix animation in terminal as foreground process |
| grip    | preview markdown files (github style) in browser with localhost server |
| tree    | recursively displays all (sub-)directories and files |

## useful shortcuts / signals
| shortcut        | description |
| :-------        | :---------- |
| ctrl-a / ctrl-e | jumps to beginning or end of line |
| ctrl-c          | sends SIGINT to current process |
| ctrl-d          | sends EOF / SIGQUIT to current process |
| ctrl-u          | clears current input buffer |
| ctrl-z          | puts current process to background (fg to bring it back up) |
| ctrl+ / ctrl-   | adjust font-size (must be supported by terminal app) |

## useful symbols
| symbol                  | description |
| :-------                | :---------- |
| $(echo hi)              | execute ` echo hi ` in a subshell and substitute with subshell's output (expand) |
| $(SOME_VAR_NAME)        | access SOME_VAR_NAME environment variable and substitute with value (expand) |
| process_1 ; process_2   | run process_1 and then run process_2 |
| process_1 || process_2  | run process_1 and then run process_2 if process_1 has failed |
| process_1 && process_2  | run process_1 and then run process_2 if process_1 was successful |
| process_1 \| process_2  | Pipe, sends output of process_1 to process_2 |
| process_1 > file_1      | Redirect, sends output of process_1 to file_1 |
| file_1 < process_1      | Redirect, sends output of process_1 to file_1 |
| process_1 2> file_1     | Redirect, sends std_err output of process_1 to file_1 |
| process_1 > file_1 2>&1 | Redirect stdout to file_1 and stderr to stdout |
| process_1 &             | Run process_1 and send it to the background (see fg or jobs to get it back) |

## useful built-in commands
| command                 | description |
| :-------                | :---------- |
| bg process_1            | bring process_1 to the background |
| column                  | organize output as columns |
| fg process_1            | bring process_1 to the foreground |
| history                 | browse the history of commands used, HISTTIMEFORMAT for timestamp |
| jobs                    | lists all running shell session related processes |
| kill -signal_number pid | send signal to process (pid) |
| kill -l                 | list all possible signals to send |
| less                    | put output in a scrollable view state (like man, vim) |
| reset                   | reset the terminal session and its output histoy (clear on steroids) |
| sudo !!                 | repeats last command with sudo |
| tail                    | follows the output of a file, watches file changes |
