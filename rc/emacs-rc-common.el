;; emacs-rc-common.el --- Common hooks and customizations

;; Highlight FIXME/TODO/BUG keywords
(defun ice/hightlight-prog-keywords ()
  (font-lock-add-keywords nil '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))
  (font-lock-add-keywords nil '(("\\<\\(DONE\\):" 1 font-lock-doc-face t)))
  ;; Highlight too long lines
  (font-lock-add-keywords nil '(("^[^\n]\\{120\\}\\(.*\\)$" 1 font-lock-warning-face t))))

;; Clean trailing whitespaces automatically
(setq ice/trailing-whitespace-modes '(c++-mode c-mode emacs-lisp-mode
					       lisp-mode scheme-mode))
(defun ice/trailing-whitespace-hook ()
  (when (member major-mode ice/trailing-whitespace-modes)
    (delete-trailing-whitespace)))
(add-hook 'before-save-hook 'ice/trailing-whitespace-hook)