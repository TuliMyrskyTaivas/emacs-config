;; emacs-rc-dict.el --- Dictionary setup for EMACS

(require 'dictionary)

(setq dictionary-server "dictd.xdsl.by")
(setq dictionary-default-dictionary "ru-en")

(global-set-key "\C-cs" 'dictionary-search)
(global-set-key "\C-cm" 'dictionary-match-words)
(global-set-key [mouse-3] 'dictionary-mouse-popup-matching-words)