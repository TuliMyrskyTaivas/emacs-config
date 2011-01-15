;; emacs-rc-org-mode.el --- Org mode customization for EMACS

(custom-set-variables
 '(org-startup-folded nil)
 '(org-log-done t)
 '(org-hide-leading-stars t)
 '(org-agenda-include-diary t)
 '(org-agenda-skip-scheduled-if-done t)
 '(org-agenda-skip-deadline-if-done t)
 '(org-agenda-include-all-todo t)
 '(org-use-property-inheritance t)
 '(org-blank-before-new-entry (quote ((heading . auto) (plain-list-item))))
 '(org-agenda-dim-blocked-tasks 'invisible)
 '(org-enforce-todo-checkbox-dependencies t)
 '(diary-file "~/.diary")
 '(mark-diary-entries-in-calendar t)
 '(org-todo-keywords '((sequence "TODO(t)" "WAITING(w)" "STARTED(s)" "|"
				 "DONE(d)" "CANCELED(c)")))
 '(org-agenda-files (quote ("~/.emacs.d/org-mode/emacs.org"
			    "~/.emacs.d/org-mode/education.org"
			    "~/.emacs.d/org-mode/programming.org"
			    "~/.emacs.d/org-mode/notes.org"
			    "~/.emacs.d/org-mode/weather.org"))))

(require 'org-install)
(require 'org-habit)

(add-to-list 'auto-mode-alist '("\\.\\(org\\|org_archive\\|/TODO\\)$" . org-mode))

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

(add-hook 'org-mode-hook 'turn-on-font-lock)

(require 'diary-lib)
(add-hook 'diary-display-hook 'fancy-diary-display)

;; Remember mode
(org-remember-insinuate)
(setq org-directory "~/.emacs.d/org-mode")
(setq org-default-notes-file (concat org-directory "/notes.org"))
(define-key global-map "\C-cr" 'org-remember)
(setq org-remember-templates
      '(
	("Todo" ?t "* TODO %?\n  %i\n  %a" (concat org-directory "/TODO.org") "Tasks")
	))

;; iCalendar
(autoload 'icalendar-import-buffer "icalendar" "Import iCalendar data from current buffer" t)

;; Org + Appt
(defun ice/org-agenda-to-appt ()
  (interactive)
  (setq appt-time-msg-list nil)
  (org-agenda-to-appt))
(add-hook 'org-finalize-agenda-hook 'ice/org-agenda-to-appt)
(ice/org-agenda-to-appt)
(run-at-time "24:01" nil 'ice/org-agenda-to-appt)
(run-at-time "00:59" 3600 'org-agenda-save-all-buffers)
(appt-activate t)

;; 5 minute warning
(setq appt-message-warning-time '60)
(setq appt-display-interval '15)

;; On-Screen-Display (osd)
(defun org-osd-display (min-to-app new-time msg)
  (osd-display msg msg -1 "center" "Tahoma 40"))
(setq appt-disp-window-function (function org-osd-display))
(setq appt-display-format 'window)