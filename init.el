;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; Dont be silly, to get newest emacs do this...
;; > brew install emacs --cocoa --srgb
;; > brew linkapps Emacs
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; Load my prefs
(add-to-list 'load-path "~/.emacs.d/config/")

;; This function was taken from http://truongtx.me/2013/01/07/emacs-package-manager/
;; All credit goes to him. I've also based the directory layout of my .emacs.d based
;; off of what I have learned from his at https://github.com/tmtxt/.emacs.d
(require 'package)
(dolist (source '(("marmalade" . "http://marmalade-repo.org/packages/")
                  ("elpa" . "http://tromey.com/elpa/")
                  ("melpa" . "http://melpa.milkbox.net/packages/")
                  ))
  (add-to-list 'package-archives source t))
(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))
(defvar zro/packages
  '(auto-complete
    yasnippet
    git
    git-blame
    cider
    paredit
    ecb
    bats-mode))
(dolist (p zro/packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; Personal requires
(require 'zro-defaults)
(require 'zro-ecb)
(require 'zro-git)
(require 'zro-auto-complete)
(require 'zro-yasnippet)
(require 'zro-cider)
(require 'zro-clojure)
(require 'zro-javascript)
(require 'zro-bats)

;; Custom variable file
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)
