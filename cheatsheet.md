# TMUX
From one terminal
```
t new -t "project" -s "project_dev"
```
From another
```
t new -t "project" -s "project_run"
```
Then attach to each one with `t attach -t "project_dev"` or `t attach -t "project_run"`

send command to tmux without connecting
```
tmux send-keys -t testmult:1.1 "echo 'Hello World'" ENTER
```
