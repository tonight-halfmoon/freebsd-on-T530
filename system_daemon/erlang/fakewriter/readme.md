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

## Stop Command
There are many options
. Evaluate `/bin/kill` on the PID and delete the PID File in stop_cmd and stop_postcmd functions
. The program that is wrapped by this system daemon is providing API for descendly stopping and cleaning the process

- For both options, stopping the daemon is applicable as follows

```
# /usr/local/etc/rc.d/fw stop
```

## Bash Script
- Bash script lauches the program postfixed with '&'
- The bash script is responsible to find out the PID and to persist the value 
- Since Rc.d script is passing a file path. Bash script is going to use that to store the PID

## PID File
Your Program or the launching bash script needs to write the pid of the programm process in a Pid File.
Once the pidfile is logged having the value of the system process ID then the RC.d will be able to manage it

- Check the pid file

```
cat /var/run/fw/pid
```

- Output could be as follows

```
11895
```

- As root Usre check the running process wiht `ps`
- you will get something like the following

```
 PID TT  STAT    TIME COMMAND
11895 v0- I    0:00.27 /usr/local/lib/erlang/erts-8.3.5.7/bin/beam.smp -S 1 -- -root /usr/local/lib/erlang -progname erl -- -home / -- -pa
```

- The PID File contents and the PID in the output of command `ps` match

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

