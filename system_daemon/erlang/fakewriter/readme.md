
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
# sysrc /usr/local/etc/rc.d/fw start
```
