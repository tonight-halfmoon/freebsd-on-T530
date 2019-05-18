# Start a program as a System Daemon running in the Background

## Objective
Build a system daemon that qualifies the following specifications

- Must not depend on User Login
- Must not pause the boot-up process of the machine
- must be running seemlessly
- The process of the daemon can be found more easily and reliably
- The daemon needs to cleaup when it exits or gets stopped
- The daemon can be manually stopped
- The daemon can be descendly stopped by the operating system during reboot and shutdown

## RC.d

## Start Command
There are two options
. Start command points to the program's entry point with a binary file
. Start command points to bash script

## Bash Script
Bash script lauches the program postfixed with '&'

## PID File
Your Program or the launching bash script needs to write the pid of the programm process in a Pid File.
Once the pidfile is logged having the value of the system process ID then the RC.d will be able to manage it

## Program

```
../fakewriter $ erl -make
```

```
../fakewriter # cp -r ebin /usr/local/fakewriter
```

```
../fakewriter # cp runner /usr/local/fakewriter
```

```
../fakewriter # cp ./usr/local/etc/rc.d/fw /usr/local/etc/rc.d/
```

```
# sysrc fw_enable=YES
```

```
# /usr/local/etc/rc.d/fw start
```
