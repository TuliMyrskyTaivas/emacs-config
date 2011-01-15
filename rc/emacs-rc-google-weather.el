;; emacs-rc-google-weather.el --- Google Weather for EMACS

(add-to-list 'load-path "~/.emacs.d/google-weather")
(require 'google-weather)
(require 'org-google-weather)

(custom-set-variables
 '(org-google-weather-location "Moscow"))