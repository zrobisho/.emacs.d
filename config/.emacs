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


(add-to-list 'load-path "/usr/local/Cellar/git/2.0.4/share/git-core/contrib/emacs")
(require 'git)

;; ECB stuff

(require 'ecb)
(require 'ecb-autoloads)
(setq ecb-layout-name "left3")
(setq ecb-show-sources-in-directories-buffer 'always)
(setq ecb-set-compile-window-height 12)

(setq ecb-tip-of-the-day nil)
(defadvice ecb-show-tip-of-the-day (around surpress-dialog)
  (interactive)
  (let ( (window-system nil)
         (ecb-tip-of-the-day t)
         )
    ad-do-it))
(ad-activate 'ecb-show-tip-of-the-day)


(global-linum-mode t)
(setq line-number-mode t)
(setq make-backup-files nil)
(setq column-number-mode t)

(setq c-default-style "linux"
      c-basic-offset 4)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (tsdh-dark)))
 '(initial-frame-alist (quote ((fullscreen . maximized))))
 '(ecb-options-version "2.40")
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


(defun refresh-chrome-on-save ()
    (shell-command-to-string "chrome-cli reload"))

(add-hook 'after-save-hook 'refresh-chrome-on-save)
