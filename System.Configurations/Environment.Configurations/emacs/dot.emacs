;;; package --- Summary:

;;; Commentary:

;;; Welcome to Machine \(-_^)/

;;; Code:

(require 'package)
(add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
(add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")) t)

(package-initialize)

(custom-set-variables
 '(custom-enabled-themes (quote (manoj-dark)))
 '(font-use-system-font nil)
 '(safe-local-variable-values (quote ((sh-indent-comment . t) (allout-layout . t))))
 '(whitespace-display-mappings (quote ((space-mark ?\ [ ] [?.] [0] [32] [42] [46]))))
 )
(custom-set-faces
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

;; Local Variables:
;; coding: utf-8
;; buffer-file-coding-system: utf-8
;; mode: emacs-lisp
;; indent-tabs-mode: nil
;; End:
;; vim: sw=2 ts=2 et
;;; .emacs ends here
