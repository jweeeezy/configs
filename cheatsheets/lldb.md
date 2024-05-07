# lldb for debugging c/c++
- binary must be compiled with -g flag
- different approaches for interactive vs. noninteractive binary

## lldb start/setup
| command    | description |
| :--------- | :---------- |
| lldb | starts a lldb session |
| (lldb) target create <binary_name> | starts a lldb session |
| (lldb) target run <arguments> | runs the binary with lldb (and arguments |

### or

| command    | description |
| :--------- | :---------- |
| lldb <binary_name> <arguments> | hooks lldb to binary with arguments |
| (lldb) run | runs given setup |

### or

| command    | description |
| :--------- | :---------- |
| lldb | starts up lldb |
| (lldb) process --attach --name <binary_name> --waitfor | waits for binary to start and attaches lldb |
| (lldb) process continue | continues binary data flow |

## lldb active debugging
| command    | description |
| :--------- | :---------- |
| (lldb) b (function/file) | sets a breakpoint at target |
| (lldb) n | next step |
| (lldb) s | step in |
| (lldb) var | print current variables |
| (lldb) help watchpoint | help information for watchpoints |
| (lldb) gui | starts up terminal-based gui |
