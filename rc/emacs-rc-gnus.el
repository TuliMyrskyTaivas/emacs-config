;; emacs-rc-gnus.el --- GNUS configuration file for EMACS
(require 'gnus-setup)
(require 'gnus-art)
(require 'gnus-cite)

;; Setup GMail account
(setq send-mail-function 'smtpmail-send-it
      message-send-mail-funtion 'smtpmail-send-it
      smtpmail-starttls-credentials '(("smtp.gmail.com" 587 nil nil))
      smtpmail-auth-credentials '(("smtp.gmail.com" 587 "ice.nightcrawler@gmail.com" nil))
      smtpmail-default-smtp-server "smtp.gmail.com"
      smtpmail-smtp-server "smtp.gmail.com"
      smtpmail-smtp-service 587
      smtpmail-debug-info t)

(require 'starttls)
(require 'smtpmail)

(add-to-list 'gnus-secondary-select-methods
	     '(nnimap "gmail"
		      (nnimap-address "imap.gmail.com")
		      (nnimap-server-port 993)
		      (nnimap-stream ssl)))

(setq gnus-posting-style '((".*"
			    (Gcc "nnml:sent")
			    (Organization "Kaspersky Lab")
			    (signature-file "~/.signature"))))

;; Moving mails to trash in Google Mail
(setq gdt-trash-newsgroup "nnimap+gmail:[Gmail/Trash]")
(defun gdt-gnus-move-to-trash ()
  (interactive)
  (gnus-summary-move-article nil gdt-trash-newsgroup))

(add-hook 'gnus-summary-mode-hook
	  (lambda ()
	    (local-set-key "D" 'gdt-gnus-move-to-trash)))

;; Mail decoding
(eval-after-load "mm-decode"
  '(progn
     (add-to-list 'mm-discouraged-alternatives "text/html")
     (add-to-list 'mm-discouraged-alternatives "text/richtext")))

;; Integration with BBDB
(require 'bbdb)
(bbdb-initialize 'gnus 'message)
(add-hook 'gnus-startup-hook 'bbdb-insinuate-gnus)
(add-hook 'message-setup-hook 'bbdb-define-all-aliases)

;; Hooks
(defun ice/message-mode-hook ()
  (auto-fill-mode t)
  (font-lock-mode t)
  (abbrev-mode t)
  (setq fill-column 75)
  (orgstruct++-mode 1)
  (flyspell-mode 1)
  (local-set-key [(tab)] 'bbdb-complete-name))

(defun ice/mime/editor-mode-hook ()
  (put-alist "Subject" nil mime/field-encoding-method-alist)
  (put-alist "To" nil mime/field-encoding-method-alist))
(add-hook 'mime/editor-mode-hook 'ice/mime/editor-mode-hook)

(defun ice/gnus-article-display-hook ()
  (gnus-article-highlight)
  (gnus-article-hide-headers-if-wanted)
  (setq gnus-visible-headers
	'("^From:" "^X-Comment-To:" "^Comment-To:" "^Subject:" "^Date:"
	  "^Followup-To:" "^Reply-To:" "^Organization:" "^Summary:"
	  "^Keywords:" "^To:" "^Cc:" "^Posted-To:" "^Mail-Copies-To:"
	  "^Apparently-To:" "^Gnus-Warning:" "^Recent-From" "^Bcc:" ))
  (article-emphasize))
(add-hook 'gnus-article-display-hook 'ice/gnus-article-display-hook)

(defun ice/gnus-summary-mode-hook ()
  (save-excursion
    (goto-char (point-min))))
(add-hook 'gnus-summary-mode-hook 'ice/gnus-summary-mode-hook)

;; Remove automatic total expire hook
(remove-hook 'gnus-summary-prepare-exit-hook
	     'gnus-summary-expire-articles)
(add-hook 'gnus-exit-gnus-hook
	  'gnus-group-expire-all-groups)

;; Sorting
(setq gnus-article-sort-functions '(gnus-article-sort-by-number
				    gnus-article-sort-by-subject
				    gnus-article-sort-by-date))
(setq gnus-thread-sort-functions '(gnus-thread-sort-by-number
				   gnus-thread-sort-by-subject
				   gnus-thread-sort-by-total-score
				   gnus-thread-sort-by-date))

;; Set format of group description
(setq gnus-group-line-format "%M\%S\%p\%5y: %g\n")

;; Topic mode
(add-hook 'gnus-group-mode-hook 'gnus-topic-mode)
(setq gnus-topic-line-format "%i%3A: %(%{%n}%)%v\n")
(setq gnus-summary-line-format "%U%R%z%I%(%[%4L: %-23,23n%]%) %s\n")

;; Fetch headers for an old articles in the current thread
(setq gnus-fetch-old-headers '500)

;;
(setq gnus-gcc-mark-as-read t
      nntp-marks-is-evil nil
      nnml-marks-is-evil nil
      gnus-show-time t
      gnus-show-mime-method 'gnus-article-preview-mime-message
      gnus-expert-user t
      gnus-suppress-duplicates t
      gnus-confirm-mail-reply-to-news t
      gnus-ignored-newsgroups ""
      nnml-get-new-mail t
      gnus-add-to-list t
      gnus-large-newsgroup nil
      gnus-inhibit-startup-message t
      gnus-read-active-file t
      gnus-check-new-newsgroups 'ask-server
      gnus-use-sc t
      gnus-select-method '(nnnil "")
      mail-signature t
      gnus-strict-mime t
      gnus-novice-user nil
      gnus-auto-select-next nil
      gnus-cite-minimum-match-count 1)