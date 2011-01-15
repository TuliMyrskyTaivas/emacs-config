;; CEDET configuration file for EMACS

(load-file "~/.emacs.d/cedet-1.0/common/cedet.el")

;; Enable EDE (Project Management) features
(global-ede-mode 1)

;; Enable Semantic (code parsing, smart completion) features
(semantic-load-enable-excessive-code-helpers)

;; Enable SRecode (Template management) minor mode
(global-srecode-minor-mode 1)

(require 'semantic-ia)