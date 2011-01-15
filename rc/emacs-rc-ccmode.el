;;; emacs-rc-ccmode.el --- C/C++ mode setup for EMACS

(require 'cc-mode)

(defun ice/c-mode-common-hook ()
  ;; style customization
  (c-toggle-auto-hungry-state 0)
  (c-set-offset 'member-init-intro '++)
  (c-set-offset 'substatement-open 0)
  (c-set-style "bsd")
  (setq tab-width 4)
  (setq c-basic-offset 4)
  (setq indent-tabs-mode t)
  ;; minor modes
  (auto-fill-mode t)
  (gtags-mode t)
  (hs-minor-mode t)
  ;; local keys
  (local-set-key [return] 'newline-and-indent))

(add-hook 'c-mode-common-hook 'ice/c-mode-common-hook)
(add-hook 'c-mode-common-hook 'ice/highlight-prog-keywords)

(setq c-default-style "bsd" c-basic-offset 4)
(setq c++-default-style "bsd" c-basic-offset 4)
