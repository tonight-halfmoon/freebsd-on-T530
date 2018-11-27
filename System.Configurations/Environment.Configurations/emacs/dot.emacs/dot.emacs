
;;; package --- Summary:

;;; Commentary:

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.

;;; Code:
(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
		    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;;; Comment/uncomment these two lines to enable/disable MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
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
 '(font-use-system-font t)
 '(package-selected-packages
   (quote
    (kotlin-mode scala-mode flycheck-rebar3 flycheck-color-mode-line flycheck-kotlin flycheck company)))
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

;; (add-to;;-list 'custom-theme-load-path "~/.emacs.d/themes")
;; (load-t;heme 'hickey t)
 
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)

(global-flycheck-mode t)
(add-hook 'after-init-hook 'global-company-mode)

(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0/")
(require 'color-theme)
(color-theme-initialize)
;; (color-theme-bharadwaj)
;; (color-theme-charcoal-black)
(color-theme-digital-ofs1)
;; (color-theme-euphoria)

(add-hook 'emacs-lisp-mode-hook
	  (lambda()
	    (face-remap-add-relative
	     'mode-line '((:foreground "green" :background "black") mode-line))))

;; Kotlin mode
;;(add-to-list 'load-path "~/.emacs.d/kotlin/")

(require 'flycheck-kotlin)
(add-hook 'kotlin-mode-hook 'flycheck-mode)

;; Scala mode
(add-to-list 'load-path "~/.emacs.d/emacs-scala-mode/")
(require 'scala-mode)

;; Image dimensions
 (load "~/.emacs.d/image-dimensions/image-dimensions-minor-mode.el")
 (eval-after-load 'image-mode '(require 'image-dimensions-minor-mode))

(setq frame-title-format
      '(buffer-file-name
	("%b (Emacs) %f" image-dimensions-minor-mode-dimensions)
	(dired-directory
	 (:eval (concat (buffer-name) " (Emacs) " dired-directory))
	 ("%b (Emacs)"))))

(provide '.emacs)
;;; .emacs ends here
