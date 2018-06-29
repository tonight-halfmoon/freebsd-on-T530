(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode t)
 '(cursor-type (quote hbar))
 ;; '(custom-enabled-themes (quote (wheatgrass))))
 '(custom-enabled-themes (quote (tango-dark)))
 '(font-use-system-font t)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; Erlang Mode
(setq load-path (cons "/usr/local/lib/erlang/lib/tools-2.9.1/emacs" load-path))
(setq erlang-root-dir "/usr/local/lib/erlang")
(setq exec-path (cons "/usr/local/lib/erlang/bin" exec-path))
(require 'erlang-start)

(set-cursor-color "#7F00FF")
(setq inhibit-startup-screen t)

;; Global Keys
(global-set-key (kbd "M-1") 'kill-whole-line)
(global-set-key (kbd "M-o") 'ace-window)
;; Reference: https://www.gnu.org/software/emacs/manual/html_node/efaq/Backspace-invokes-help.html
(normal-erase-is-backspace-mode 1)
