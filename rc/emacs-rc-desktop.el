;; emacs-rc-desktop.el --- Load desktop settings

(setq-default desktop-missing-file-warning nil)
(setq-default desktop-path (quote ("~")))
(setq-default desktop-save t)
(setq-default desktop-save-mode t)
(setq-default save-place t)

(add-to-list 'desktop-locals-to-save 'buffer-file-coding-system)
(add-to-list 'desktop-locals-to-save 'tab-width)

(defun ice/desktop-ignore-semantic (desktop-buffer-file-name)
  "Function to ignore CEDET minor modes during restore of buffers"
  nil)
(add-to-list 'desktop-minor-mode-handlers '(semantic-stickyfunc-mode . ice/desktop-ignore-semantic))
(add-to-list 'desktop-minor-mode-handlers '(senatoc-minor-mode . ice/desktop-ignore-semantic))
(add-to-list 'desktop-minor-mode-handlers '(semantic-idle-scheduler-mode . ice/desktop-ignore-semantic))
(add-to-list 'desktop-minor-mode-handlers '(semantic-idle-summary-mode . ice/desktop-ignore-semantic))
(add-to-list 'desktop-minor-mode-handlers '(semantic-idle-completions-mode . ice/desktop-ignore-semantic))
(add-to-list 'desktop-minor-mode-handlers '(semantic-mru-bookmark-mode . ice/desktop-ignore-semantic))
(add-to-list 'desktop-minor-mode-handlers '(semantic-decoration-mode . ice/desktop-ignore-semantic))
(add-to-list 'desktop-minor-mode-handlers '(srecode-minor-mode . ice/desktop-ignore-semantic))
(add-to-list 'desktop-minor-mode-handlers '(ede-minor-mode . ice/desktop-ignore-semantic))

(desktop-read)