;; emacs-rc-decor.el --- EMACS decorations

(load-library "time")
(setq display-time-24hr-format t
      display-time-mail-file t
      display-time-form-list (list 'time 'load)
      display-time-day-and-date t)
(display-time)
(blink-cursor-mode t)

(require 'mwheel)
(mwheel-install)

;; use y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; ste misceonalleous decoration variables
(custom-set-variables
 '(global-font-lock-mode t)
 '(scalable-fonts-allowed t)
 '(uniquify-buffer-name-style (quote forward))
 '(use-dialog-box nil)
 '(column-number-mode t)
 '(display-time-mode t)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(menu-bar-mode nil)
 '(visible-bell t)
 '(custom-buffer-done-kill t)
 '(initial-scratch-message nil)
 '(inhibit-startup-message t)
 '(transient-mark-mode t))