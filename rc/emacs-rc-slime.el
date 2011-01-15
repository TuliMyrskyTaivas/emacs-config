;;; emacs-rc-slime.el --- SLIME configuration for EMACS

(require 'inf-lisp)
(setq inferior-lisp-program "sbcl")
(setq slime-net-encoding-system 'utf-8-unix)

(require 'slime)
(slime-setup)
(add-hook 'lisp-mode-hook
	  (lambda ()
	    (slime-mode t)))
(add-hook 'inferior-lisp-mode-hook
	  (lambda ()
	    (inferior-slime-mode t)))

(add-to-list 'slime-lisp-implementations '(sbcl ("sbcl")
						:coding-system
						utf-8-unix))

(setq slime-use-autodoc-mode nil)
(eval-after-load "slime"
  '(progn
     (slime-setup '(slime-fancy slime-asdf slime-banner slime-fuzzy))
     (setq slime-complete-symbol*-fancy t)
     (setq slime-complete-symbol-function
	   'slime-fuzzy-complete-symbol)
     ))

(global-set-key [f5] 'slime)
(global-set-key [(control f11)] 'slime-selector)
