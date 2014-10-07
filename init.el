
;; Load my prefs
(add-to-list 'load-path "~/.emacs.d/config/")

;; This function was taken from http://truongtx.me/2013/01/07/emacs-package-manager/
;; All credit goes to him. I've also based the directory layout of my .emacs.d based
;; off of what I have learned from his at https://github.com/tmtxt/.emacs.d
;;; Emacs is not a package manager, and here we load its package manager!
(require 'package)
(dolist (source '(("marmalade" . "http://marmalade-repo.org/packages/")
                  ("elpa" . "http://tromey.com/elpa/")
                  ;; TODO: Maybe, use this after emacs24 is released
                  ;; (development versions of packages)
                  ("melpa" . "http://melpa.milkbox.net/packages/")
                  ))
  (add-to-list 'package-archives source t))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))
(defvar zro/packages
  '(auto-complete
    yasnippet
    ecb))
(dolist (p zro/packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; Personal requires
(require 'zro-defaults)
(require 'zro-ecb)
(require 'zro-git)
(require 'zro-auto-complete)

;; Custom variable file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; Refesh open webpage on save
;;(defun refresh-chrome-on-save ()
;;    (shell-command-to-string "chrome-cli reload"))
;; ... and call it on each save
;;(add-hook 'after-save-hook 'refresh-chrome-on-save)
