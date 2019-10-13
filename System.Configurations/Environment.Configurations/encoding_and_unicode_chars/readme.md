  * Append file `/etc/login.conf` with the following

  ```
      default:\
        :charset=UTF-8:\
        :lang=en_GB.UTF-8:\
  ```

  * Evaluate the following command

  ```
      # cap_mkdb /etc/login.conf
  ```

  * Amend $HOME/.login_conf with the following (especially if your prompt screen, or man pages show strange chars)

  ```
      me:\
        :setenv=LC_COLLATE=C,LC_TYPE=en_GB.UTF-8,LC_ALL=C:\
        :charset=UTF-8:\
        :tc-default:
  ```
