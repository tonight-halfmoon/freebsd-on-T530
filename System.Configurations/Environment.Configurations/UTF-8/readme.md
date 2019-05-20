
0. Append file `/etc/login.conf` with the following lines in section default:\

```
:charset=UTF-8:\
:lang=en_GB.UTF-8:\
```

1. Evaluate the following command

```
 # cap_mkdb /etc/login.conf
```
