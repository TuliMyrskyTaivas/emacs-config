;;; Main configuration file for EMACS
;;; 2010-09-15

(setq load-path (cons "/home/ice/.emacs.d" load-path))
(setq url-proxy-services '(("http" . "localhost:6969")))
(require 'icalendar)
(calendar-set-date-style 'iso)

;; Switch between work (hurricane) and home (infinity) machines
(cond ((string-match "hurricane" (system-name))
       (setq add-log-mailing-address "Andrey.Sploshnov@kaspersky.com")
       )
      ((string-match "infinity" (system-name))
       (setq add-log-mailing-address "ice.nightcrawler@gmail.com")
       ))

;; Load pieces of configuration
(if (file-exists-p "~/.emacs.d/rc/emacs-rc-common.el")
    (load-file "~/.emacs.d/rc/emacs-rc-common.el"))
(if (file-exists-p "~/.emacs.d/rc/emacs-rc-backup.el")
    (load-file "~/.emacs.d/rc/emacs-rc-backup.el"))
(if (file-exists-p "~/.emacs.d/rc/emacs-rc-org-mode.el")
    (load-file "~/.emacs.d/rc/emacs-rc-org-mode.el"))
(if (file-exists-p "~/.emacs.d/rc/emacs-rc-cedet.el")
    (load-file "~/.emacs.d/rc/emacs-rc-cedet.el"))
(if (file-exists-p "~/.emacs.d/rc/emacs-rc-google-maps.el")
    (load-file "~/.emacs.d/rc/emacs-rc-google-maps.el"))
(if (file-exists-p "~/.emacs.d/rc/emacs-rc-google-weather.el")
    (load-file "~/.emacs.d/rc/emacs-rc-google-weather.el"))
(if (file-exists-p "~/.emacs.d/rc/emacs-rc-gnus.el")
    (load-file "~/.emacs.d/rc/emacs-rc-gnus.el"))
(if (file-exists-p "~/.emacs.d/rc/emacs-rc-nethack.el")
    (load-file "~/.emacs.d/rc/emacs-rc-nethack.el"))
(if (file-exists-p "~/.emacs.d/rc/emacs-rc-ccmode.el")
    (load-file "~/.emacs.d/rc/emacs-rc-ccmode.el"))
(if (file-exists-p "~/.emacs.d/rc/emacs-rc-elisp.el")
    (load-file "~/.emacs.d/rc/emacs-rc-elisp.el"))
(if (file-exists-p "~/.emacs.d/rc/emacs-rc-decor.el")
    (load-file "~/.emacs.d/rc/emacs-rc-decor.el"))
(if (file-exists-p "~/.emacs.d/rc/emacs-rc-lisp.el")
    (load-file "~/.emacs.d/rc/emacs-rc-lisp.el"))
(if (file-exists-p "~/.emacs.d/rc/emacs-rc-slime.el")
    (load-file "~/.emacs.d/rc/emacs-rc-slime.el"))
; now use org-mode.el instead of planner.el
;(load-file "~/.emacs.d/rc/emacs-rc-planner.el")

;; Useful functions
(defun insert-date-string ()
  "Insert a nicely formated date string."
  (interactive)
  (insert (format-time-string "%Y-%m-%d")))

;; -------------- Key bindings ----------------------------
(define-key esc-map "g" 'goto-line)
(define-key esc-map "n" 'next-error)
(define-key esc-map "i" 'ispell-word)
(define-key esc-map "f" 'cscope-find-this-file)
(define-key esc-map "s" 'cscope-find-this-symbol)
(define-key esc-map "d" 'cscope-find-global-definition)
(define-key esc-map "t" 'insert-date-string)

;;Treat 'y' or <CR> as yes, 'n' as no
(fset 'yes-or-no-p 'y-or-n-p)

;; Scrolling
(setq scroll-conservatively 50)
(setq scroll-preserve-screen-position 't)
(setq scroll-margin 10)

;; Load third-party libraries
(load-library "p4")           ;; Intergration with Perforce
(load-library "follow-mouse") ;; Auto-select frames with mouse
(setq follow-mouse-deselect-active-minibuffer nil)
(turn-on-follow-mouse)

;; GUD interface
(setq gdb-many-windows 't)

;; CScope interface
(require 'xcscope)
(define-key global-map [(control f3)] 'cscope-find-this-symbol)
(define-key global-map [(control f4)] 'cscope-find-global-definition)

;;Some nice features
(display-time)
(setq visible-bell 1)
(desktop-save-mode 1)
(require 'color-theme)
;;(color-theme-goldenrod)
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)
(setq-default tab-stop-list '(4 8 12 16))

(global-visual-line-mode 1) ; since Emacs23
(global-linum-mode 1) ; since Emacs23

;; C++ and C mode...
(defun my-c++-mode-hook ()
  (setq tab-width 4)
  (define-key c++-mode-map "\C-m" 'reindent-then-newline-and-indent)
  (define-key c++-mode-map "\C-ce" 'c-comment-edit)
  (setq c++-auto-hungry-initial-state 'none)
  (setq c++-delete-function 'backward-delete-char)
  (setq c++-tab-always-indent t)
  (setq c-basic-offset 4)
  (setq c-indent-level 4)
  (setq c-continued-statement-offset 4)
  (setq c++-empty-arglist-indent 4)
  )

(defun my-c-mode-hook ()
  (setq tab-width 4)
  (define-key c-mode-map "\C-m" 'reindent-then-newline-and-indent)
  (define-key c-mode-map "\C-ce" 'c-comment-edit)
  (setq c-auto-hungry-initial-state 'none)
  (setq c-delete-function 'backward-delete-char)
  (setq c-tab-always-indent t)
  (setq c-basic-offset 4)
;; BSD-ish indentation style
  (setq c-indent-level 4)
  (setq c-continued-statement-offset 4)
  (setq c-brace-offset -4)
  (setq c-argdecl-indent 0)
  (setq c-label-offset -4))

;; doxymacs
;(defun my-doxymacs-font-lock-hook ()
;  (if (or (eq major-mode 'c-mode) (eq major-mode 'c++-mode))
;      (doxymacs-font-lock)))

;; Add all of the hooks...
(add-hook 'c++-mode-hook 'my-c++-mode-hook)
(add-hook 'c-mode-hook 'my-c-mode-hook)
;(add-hook 'c-mode-common-hook 'doxymacs-mode)
(add-hook 'c-mode-common-hook 'turn-on-auto-fill)
;(add-hook 'font-lock-mode-hook 'my-doxymacs-font-lock-hook)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(color-theme-selection "Charcoal Black" nil (color-theme_seldefcustom))
 '(column-number-mode t)
 '(display-time-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;; Change buffer naming scheme
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

;; W3M
(require 'w3m-load)
(require 'mime-w3m)
