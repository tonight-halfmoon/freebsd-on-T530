
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;;; Code:
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(blink-cursor-mode t)
 '(cursor-type (quote hbar))
 ;'(custom-enabled-themes (quote (tsdh-dark)))
 '(font-use-system-font t)
 '(package-selected-packages (quote (flycheck company)))
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
(setq x-super-keysum 'meta)
;; Reference: https://www.gnu.org/software/emacs/manual/html_node/efaq/Backspace-invokes-help.html
(normal-erase-is-backspace-mode 0)

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

;; (require 'clang-format)
;; (global-set-key (kbd "C-c i") 'clang-format-region)
;; (global-set-key (kbd "C-c u") 'clang-format-buffer)

;; (setq clang-format-style-option "llvm")

;(add-to;;-list 'custom-theme-load-path "~/.emacs.d/themes")
;(load-t;heme 'hickey t)
 
(add-to-list 'package-archives '("melpa" . "http://stable.melpa.org/packages/") t)


(add-hook 'emacs-lisp-mode-hook
	  (lambda()
	    (face-remap-add-relative
	     'mode-line '((:foreground "cyan" :background "black") mode-line))))

(global-flycheck-mode t)


(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0/")
(require 'color-theme)
(color-theme-initialize)
;;(color-theme-bharadwaj)
;;(color-theme-charcoal-black)
(color-theme-digital-ofs1)
;(color-theme-euphoria)

 
(provide '.emacs)
;;; .emacs ends here
