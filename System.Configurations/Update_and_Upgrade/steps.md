## Experience on FreeBSD and system packages update and upgrade
Experience with commands related to performing update and upgrade to the FreBSD operating system and the instaled packages

### Update & Install packages

  ```
  # portupgrade -ra

  ```

### Updating the base FreeBSD Operating System

  ```
  # freebsd-update fetch install
  ```

### Update and Upgrade Installed Packages

  * Follow the steps as described in the official documentation of FreeBSD on System Upgrade.
    And then perhaps you could continue as follows: (at least that what I had to do)

  ```
  # `portsnap fetch update && portsnap fetch extract && portmaster -ady --no-confirm`
  # portupgrade -a
  # pkg update && pkg upgrade
  ```

### Lock and Unlock for Portmaster

  * When `pkg upgrade` asks to downgrade/reinstall packages that was initially installed by `portmaster`, then\
    you can lock them


  ```
  # pkg lock <package_name>
  ```

### Manipulate and fix issues by upgrading adn downgrading

  * Read man pkg-static before you consider the following command.
    But in some situations it's helpful to start all over.

  ```
  # pkg-static upgrade -f
  ```

### Fix broken portmaster packages update

  * When something goes wrong with a package then try the following

  * Remove it with portmaster

  ```
  # portmaster -w -r <package-name>
  ```

  * Remove it with the package manager

  ```
  # pkg remove <package-name>
  ```

  * Example: `pkg remove libXTrap`

  * In case you are not sure about the package name, then search for it


  ```
  # pkg search key
  ```

  * In case the command with optin -r does not work try without it, as follows:

  ```
  # portmaster -w package-name
  ```

  * Find out the reason of failure. If that is because of packages conflict, the deinstall the other package which the cause.
    Sometimes, it may even need to deinstall the package first. Then, try again.

  * Then, to continue the full update. Try with the following

  ```
  # portmaster -afR --no-confirm
  ```

### Clean up


  ```
  # portmaster --clean-distfiles -y
  # portsclean -C
  # portsclean -DD
  --> to delete many packages at once with regX
  # pkg delete -R '*proto-*'a

  ```

### Upgrade certain package


  ```
  # Upgrade a package
  # portupgrade -R firefox
  ```


### Upgrading FreeBSD to target release

  ```
  # freebsd-update fetch
  ```

  ```
  # freebsd-update upgrade -r 11.2

  # freebsd-update install
  ```

### Uninstall/Deinstall packages

  * Method 1


    ```
    # pkg_deinstall name

    ```

  * Method 2


    ```
    # /usr/ports/name make deinstall
    ```


### Fix broken packages when they depend on packages has been removed

  ```
  # pkg update -f

  # pkg check -a -d
  ```

### Autoremove left-over packages


  ```
  # pkg autoremove
  ```

### Fix update


  ```
  # pkg-static upgrade -f
  ```

  ```
  # portmaster -afG
  ```

  ```
  # freebsd-update fetch
  ```

  ```
  # freebsd-update install
  ```

  ```
  # portupgrade -ra
  ```

  ```
  # pkg-static install -f pkg
  ```

  ```
  #  portmaster -ady
  ```

  ```
  # pkg upgrade -f
  ```

---
### References:
---
    * [](https://www.freebsd.org/doc/handbook/ports-using.html)
    * [](https://forums.freebsd.org/threads/not-able-to-build-gnupg.52242/)
    * FreeBSD Handbook Section "Freebsdupdate-portsbuild" in "updating-upgrading-freebsdupdate"
    * [DigitalOcean - Community](https://www.digitalocean.com/community/tutorials/an-introduction-to-basic-freebsd-maintenance)
