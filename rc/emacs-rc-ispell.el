;;; emacs-rc-ispell.el --- spell checker settings for EMACS

(require 'ispell)

(setq ispell-local-dictionary "english")

(defun turn-on-flyspell ()
  "Force flyspell-mode on using positive argument. For use in hooks."
  (interactive)
  (flyspell-mode t))

(autoload 'flyspell-mode "flyspell" "On-the-fly spelling checker." t)
(add-hook 'message-mode-hook 'turn-on-flyspell)
(add-hook 'text-mode-hook 'turn-on-flyspell)
(add-hook 'nxml-mode-hook 'turn-on-flyspell)
(add-hook 'texinfo-mode-hook 'turn-on-flyspell)
(add-hook 'TeX-mode-hook 'turn-on-flyspell)

(add-hook 'c-mode-common-hook 'flyspell-prog-mode)
(add-hook 'lisp-mode-hook 'flyspell-prog-mode)
(add-hook 'emacs-lisp-mode-hook 'flyspell-prog-mode)