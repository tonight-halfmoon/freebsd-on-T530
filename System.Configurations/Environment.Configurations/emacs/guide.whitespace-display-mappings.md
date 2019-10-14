## Unicode Charactire `\u00B7`is displayed instead of middle-dot

### In `whitespace-mode`

    * The following line works with charset=C
    * Add it to section `(custom-set-variables ...)`

    ```
    '(whitespace-display-mappings (quote ((space-mark ?\ [ ] [?.] [0] [32] [42] [46]))))
    ```

    ..* Moreover, you may customise it manually as follows

    ..* To customize more with Emacs

        ..* Customize in emacs using

        ```
        M-x customize-option RET
        whitespace-display-mappings RET
        ```

    * To customize the color of the `dot` for whitespace
      ..* Add the following line in section `(custom-set-faces ...)`

    ```
    '(whitespace-space ((t (:bold t :foreground "green"))))
    ```
