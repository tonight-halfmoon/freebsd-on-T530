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
 '(ansi-color-names-vector
   ["#212526" "#ff4b4b" "#b4fa70" "#fce94f" "#729fcf" "#e090d7" "#8cc4ff" "#eeeeec"])
 '(beacon-color "#cc6666")
 '(blink-cursor-mode t)
 '(cursor-type (quote hbar))
 '(custom-enabled-themes (quote (sanityinc-tomorrow-night)))
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default)))
 '(fci-rule-color "#373b41")
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(font-use-system-font t)
 '(frame-background-mode (quote dark))
 '(package-selected-packages
   (quote
    (smart-mode-line whitespace-cleanup-mode color-theme-sanityinc-tomorrow clang-format kotlin-mode scala-mode flycheck-rebar3 flycheck-kotlin flycheck-color-mode-line-mode flycheck company)))
 '(tool-bar-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#cc6666")
     (40 . "#de935f")
     (60 . "#f0c674")
     (80 . "#b5bd68")
     (100 . "#8abeb7")
     (120 . "#81a2be")
     (140 . "#b294bb")
     (160 . "#cc6666")
     (180 . "#de935f")
     (200 . "#f0c674")
     (220 . "#b5bd68")
     (240 . "#8abeb7")
     (260 . "#81a2be")
     (280 . "#b294bb")
     (300 . "#cc6666")
     (320 . "#de935f")
     (340 . "#f0c674")
     (360 . "#b5bd68"))))
 '(vc-annotate-very-old-color nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; MELPA
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)

(set-cursor-color "#7F00FF")
;; (set-cursor-color "#00ff00")
(setq-default cursor-type 'hbar)
(setq-default x-stretch-cursor 1)
(setq inhibit-startup-screen t)

;; Global Keys
(global-set-key (kbd "M-1") 'kill-whole-line)
(global-set-key (kbd "M-o") 'ace-window)
(setq x-super-keysum 'meta)
;; Reference: https://www.gnu.org/software/emacs/manual/html_node/efaq/Backspace-invokes-help.html
(normal-erase-is-backspace-mode 0)

;; Erlang Mode
(setq load-path (cons "/usr/local/lib/erlang/lib/tools-2.9.1/emacs" load-path))
(setq erlang-root-dir "/usr/local/lib/erlang")
(setq exec-path (cons "/usr/local/lib/erlang/bin" exec-path))
(require 'erlang-start)

;; Distel
(add-to-list 'load-path "~/.emacs.d/distel/elisp")
(require 'distel)
(distel-setup)
(push "~/.emacs.d/distel-completion" load-path)
(require 'company-distel)
(with-eval-after-load 'company
  (add-to-list 'company-backends 'company-distel))
(setq distel-completion-valid-syntax "a-zA-Z:_-")

;; Company-mode
(add-hook 'after-init-hook 'global-company-mode)

;; format-all.el
;; --- Auto-format C, C++, JS, Python, Ruby and 25 other languages -*- lexical-binding: t -*-
(load "~/.emacs.d/emacs-format-all-the-code/format-all.el")

;;(require 'clang-format)
;;(global-set-key (kbd "C-c i") 'clang-format-region)
;;(global-set-key (kbd "C-c u") 'clang-format-buffer)
;; (setq clang-format-style-option "llvm")

;; Flycheck-mode
(global-flycheck-mode t)
(add-hook 'after-init-hook 'global-company-mode)

;; Kotlin mode
;; clone or copy https://github.com/Emacs-Kotlin-Mode-Maintainers/kotlin-mode/blob/master/kotlin-mode.el into ~/.emacs.d/
;;(add-to-list 'load-path "~/.emacs.d/kotlin/")
;;or the following
;; (load "~/.emacs.d/kotlin/kotlin-mode.el")


;; Flycheck-kotlin
;; M-x
;; package-refresh-list
;; pacakge-install flycheck-kotlin
(require 'flycheck-kotlin)
(add-hook 'kotlin-mode-hook 'flycheck-mode)

;; Scala mode
;; clone https://github.com/ensime/emacs-scala-mode.git into ~/.emacs.d/
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

;; Color-theme Sanityinc
;; Ref: https://github.com/purcell/color-theme-sanityinc-tomorrow
;; M-x package-install RET color-theme-sanityinc-tomorrow RET
;;(require 'color-theme-sanityinc-tomorrow)
;; then M-x color-theme-sanityinc-tomorrow-... /-night /-eighties -etc
;; Another method is to check it in the list of customize-theme as follows:
;; M-x customize-theme RET; Then, find the list of color-theme-sanityinc-tomorrow-* and choose

;; smart-mode-line
;; M-x pacakge-install RET smart-mode-line RET
(add-hook 'after-init-hook 'smart-mode-line-enable)

;; whitespace-cleanup-mode
;; M-x package-install RET whitespace-cleanup-mode RET
(require 'whitespace-cleanup-mode)
(global-whitespace-cleanup-mode t)
;; Color-theme-6.6.0 (differnet package)
;;(add-to-list 'load-path "~/.emacs.d/color-theme-6.6.0/")
;;(require 'color-theme)
;;(color-theme-initialize)
;; (color-theme-bharadwaj)
;; (color-theme-charcoal-black)
;;(color-theme-digital-ofs1)
;; (color-theme-euphoria)

;; Color-themes (another different package)
;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
;; (load-t;heme 'hickey t)

;; This is replaced with smart-mode-line
;;(add-hook 'emacs-lisp-mode-hook
;;	  (lambda()
;;	    (face-remap-add-relative
;;     'mode-line '((:foreground "green" :background "black") mode-line))))

(provide '.emacs)
;;; .emacs ends here
