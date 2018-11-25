
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(blink-cursor-mode t)
 '(cursor-type (quote hbar))
 '(custom-enabled-themes (quote (deeper-blue)))
 '(font-use-system-font t)
 '(package-selected-packages (quote (company)))
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

(set-cursor-color "#ff00ff")
(setq-default cursor-type 'hbar)
(setq-default x-stretch-cursor 1)
(setq inhibit-startup-screen t)

;; Global Keys
(global-set-key (kbd "M-1") 'kill-whole-line)
(global-set-key (kbd "M-o") 'ace-window)
;; Reference: https://www.gnu.org/software/emacs/manual/html_node/efaq/Backspace-invokes-help.html
(normal-erase-is-backspace-mode 1)

(add-hook 'after-init-hook 'global-company-mode)

(add-to-list 'load-path "~/.emacs.d/distel/elisp")
(require 'distel)
(distel-setup)

(push "~/.emacs.d/distel-completion" load-path)
(require 'company-distel)
(with-eval-after-load 'company
  (add-to-list 'company-backends 'company-distel))

(setq distel-completion-valid-syntax "a-zA-Z:_-")

(load "~/.emacs.d/emacs-format-all-the-code/format-all.el")


;; Image dimensions
;; Reference: https://www.emacswiki.org/emacs/image-dimensions-minor-mode.el
;; Display the image dimensions in the mode line, when viewing an image.

(load "~/.emacs.d/image-dimensions/image-dimensions-minor-mode.el")
(eval-after-load 'image-mode '(require 'image-dimensions-minor-mode))

 (setq frame-title-format
       '(buffer-file-name
         ("%b (Emacs) %f" image-dimensions-minor-mode-dimensions)
         (dired-directory
          (:eval (concat (buffer-name) " (Emacs) " dired-directory))
("%b (Emacs)"))))


;; (require 'clang-format)
;; (global-set-key (kbd "C-c i") 'clang-format-region)
;; (global-set-key (kbd "C-c u") 'clang-format-buffer)

;; (setq clang-format-style-option "llvm")


(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(load-theme 'hickey t)
