## Experience a FreeBSD System Daemon out of a Erlang OTP Application


## Setup
### Manual Steps

. At the root directory level of this project compile the Erlang source code as follows

```
fake_service$ erl -make
```

. Copy the generated Binary `.beam` files into `./_usr/local/fake_service/ebin/`

. Copy the folder `./_usr/local/fake_service` into `/usr/local/`
. Copy file './_usr/local/_etc/rc.dot.d/fake_service' into '/usr/local/etc/rc.d/'
. Configure the new service with the FreeBSD's editors of system rc files `sysrc` as follows

```
# sysrc fake_service_enable=YES
```
. Reboot to see the new service is running by evaluating the following, after you login,

```
$ tail -f /var/log/fake_service/start.log
```

## Stopping the system daemon service

In order assure that the configuraiton is healthy and the system is able to stop the service and clean the pidfile, do as follows

. Check out the PID value of the daemon

```
$ cat /var/run/fake_service/pid
```

. Compare the value resulted from the former step with the output of `ps` as root, as follows

```
# ps
```

. Try to find the process PID. If found, there must be a command describing a Erlang program is running, which is the start command that was configured in the former section

. Now stop the daemon as follows

```
# /usr/local/etc/rc.d/fake_service stop
```

. Now check again the running process left using `ps`

```
# ps
```

. At this point the PID of the daemon of our Erlang applicaiton will have been disappeared

. Check the PID file of the daemon is cleaned, as follows

```
$ ls -al /var/run/fake_service/pid
```

At this point, if the pid file has not been deleted, then stopping the daemon is not perfectly clean!


```
$ ./app_controller "start" &
```

```
$ ./app_controller "stop"
```
