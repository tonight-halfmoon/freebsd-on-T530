;;; package --- Summary:

;;; Commentary:

;;; Welcome to Machine \(-_^)/

;;; Code:

(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
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
 '(custom-enabled-themes (quote (manoj-dark)))
 '(font-use-system-font nil)
 '(package-selected-packages
   (quote
    (yaml-mode travis smart-hungry-delete es-mode js-format general groovy-mode xml+ gradle-mode pdf-tools html-to-markdown js-auto-format-mode js-auto-beautify erlstack-mode erlang markdown-mode auto-complete-distel auto-complete python-environment python-mode flycheck-pycheckers elpy flycheck-pyflakes scala-mode flycheck-color-mode-line format-all company-distel company whitespace-cleanup-mode kotlin-mode)))
 '(safe-local-variable-values (quote ((sh-indent-comment . t) (allout-layout . t))))
 '(whitespace-display-mappings (quote ((space-mark ?\ [ ] [?.] [0] [32] [42] [46]))))
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-tooltip ((t (:foreground "cyan"))))
 '(company-tooltip-selection ((t (:background "white"))))
 '(isearch ((t (:background "white" :foreground "magenta"))))
 ;; Set Mode-line Buffer -Id (file name open) Background and Foreground
 '(mode-line-buffer-id ((t (:background "black" :foreground "magenta" :weight bold :height 0.9))))
 '(whitespace-space ((t (:bold t :foreground "green"))))
 )

;; Frame Parameters
;; Change background of Buffer /Edit space
(add-to-list 'default-frame-alist '(background-color . "black"))

;; whitespace-cleanup-mode
;; M-x package-install RET whitespace-cleanup-mode RET
(require 'whitespace-cleanup-mode)

;;(global-whitespace-mode)
;;(global-whitespace-cleanup-mode)

(require 'whitespace)

;; Company-mode
(add-hook 'after-init-hook 'global-company-mode)

;; Erlang Mode
(setq load-path (cons "/usr/local/lib/erlang/lib/tools-2.9.1/emacs" load-path))
(setq erlang-root-dir "/usr/local/lib/erlang")
(setq exec-path (cons "/usr/local/lib/erlang/bin" exec-path))
(require 'erlang-start)

(add-to-list 'auto-mode-alist '("\\.config?$" . erlang-mode))
(add-to-list 'auto-mode-alist '("\\.app?$" . erlang-mode))
;; (add-to-list 'auto-mode-alist '("\\.hrl?$" . erlang-mode))
(add-hook 'erlang-mode-hook (lambda() (setq-default indent-tabs-mode nil)))

;; Erlang Indent Level
(setq-default erlang-indent-level 2)
(setq-default allout-auto-activation t)
(setq-default erlang-indent-paranthesis 2)

;; Cleanup for Whitespace, Trailing Whitespace and Indentation

;; Method  #1
;; When Erlang is major-mode Whitespace Cleanup on Save Hook
;;(add-hook 'erlang-mode-hook '(lambda() (add-hook 'before-save-hook 'whitespace-cleanup)))

;; When Erlang is major-mode Delete Trailing Whitespace
;;(add-hook 'erlang-mode-hook '(lambda() (add-hook 'before-save-hook 'delete-trailing-whitespace)))

;; When Erlang is major-mode Indent Current Buffer according to Erlang formatter
;;(add-hook 'erlang-mode-hook '(lambda() (add-hook 'before-save-hook 'erlang-indent-current-buffer)))

;; Method #2
(defun esl-erlang-mode-before-save-hook()
  (when (eq major-mode 'erlang-mode)
    (whitespace-cleanup)
    (delete-trailing-whitespace)
    (erlang-indent-current-buffer)
    )
  )
(add-hook 'before-save-hook #'esl-erlang-mode-before-save-hook)

;; Distel
(add-to-list 'load-path "~/.emacs.d/distel/elisp")
(require 'distel)
(distel-setup)

;; Flycheck-mode
(global-flycheck-mode t)

(set-face-background 'mode-line "purple")
(set-face-foreground 'mode-line "black")

(font-lock-mode t)

;; Global Keys
(global-set-key (kbd "M-9") 'kill-whole-line)

;; (set-cursor-color "#7F00FF")
(setq-default cursor-type 'hbar)
(setq-default x-stretch-cursor 1)
(setq inhibit-startup-screen t)

;; Mute Ring Bell
(setq ring-bell-function 'ignore)

;; Gradle Mode
(require 'gradle-mode)

;; Tab Indent size 2
(setq-default tab-width 2)

;; No Tabs by default. Modes that really need tabs should enable
;; indent-tabs-mode explicitly. makefile-mode already does that
;; Indent
(setq-default indent-tabs-mode nil)

;; Enable Auto Indent
(define-key global-map (kbd "RET") 'newline-and-indent)

;; JavaScript Indent Level
(setq-default js-indent-level 2)

(add-hook 'before-save-hook (lambda() (whitespace-cleanup)))
(add-hook 'before-save-hook (lambda() (delete-trailing-whitespace)))
(add-hook 'before-save-hook (lambda() (indent-according-to-mode)))

(add-hook 'before-save-hook
          (lambda() (if (not indent-tabs-mode)
                        (untabify (point-min)(point-max)))))

;; Smart Hungry Whitespace
;; after package-install smart-hungry-delete
(require 'smart-hungry-delete)
(smart-hungry-delete-add-default-hooks)
(global-set-key (kbd "<backspace>") 'smart-hungry-delete-backward-char)
(global-set-key (kbd "C-d") 'smart-hungry-delete-forward-char)


;; Python elpy
;; https://elpy.readthedocs.io/en/latest/introduction.html\#installation
(elpy-enable)

(provide '.emacs)
;;; .emacs ends here
