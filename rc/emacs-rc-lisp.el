;;; emacs-rc-lisp.el --- LISP settings for EMACS

(defun ice/lisp-mode-hook ()
  (setq indent-tab-mode t)
  (abbrev-mode t)
  (auto-fill-mode t)
  (turn-on-eldoc-mode)
  (local-set-key [return] 'newline-and-indent)
  (set (make-local-variable 'slime-lisp-implementations)
       (list (assoc 'sbcl slime-lisp-implementations))))

(add-hook 'lisp-mode-hook 'ice/lisp-mode-hook)

;; lookup information in HyperSpec
(require 'info-look)
(info-lookup-add-help
 :mode 'lisp-mode
 :regexp "[^][()'\" \t\n]+"
 :ignore-case t
 :doc-spec '(("(ansicl)Symbol Index" nil nil nil)))