
# Check the processes running Hide specs

```
# sysctl security.bsd.see_other_gids
security.bsd.see_other_gids: 0
```

# Check 

```
# sysctl security.bsd.see_other_uids
security.bsd.see_other_uids: 0
```

# Check Reading Kernel Messages Bugger for Unprivileged Users

```
# sysctl security.bsd.unprivileged_read_msgbuf
security.bsd.unprivileged_read_msgbuf: 0

```

# Check Process Debugging Facilities for Unprivileged Users
```
 # sysctl security.bsd.unprivileged_proc_debug
security.bsd.unprivileged_proc_debug: 0
```

