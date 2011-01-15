;;; emacs-rc-elisp.el --- Settings for EMACS Lisp editing

(defun ice/elisp-mode-hook ()
  (setq indent-tabs-mode t)
  (abbrev-mode t)
  (auto-fill-mode t)
  (turn-on-eldoc-mode)
  (local-set-key [return] 'newline-and-indent)
  (local-set-key [(control c) /] 'semantic-ia-complete-symbol))

(add-hook 'emacs-lisp-mode-hook 'ice/elisp-mode-hook)