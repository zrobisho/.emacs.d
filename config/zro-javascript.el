;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; All js stuff
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-hook 'js-mode-hook 'js2-minor-mode)
;;(add-hook 'js2-mode-hook 'ac-js2-mode)
;;(setq ac-js2-evaluate-calls t)
;;(setq-default ac-js2-add-prototype-completions t)
(add-hook 'js-mode-hook (lambda() (tern-mode t)))
(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;
;; NODE.JS stuff
;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(require 'nodejs-repl-eval)
(define-key js2-mode-map (kbd "C-x M-e") 'nodejs-repl-eval-function)

(add-to-list 'interpreter-mode-alist '("node" . js2-mode))

;; setup global stuff
(eval-after-load "js2-mode"
  '(progn
     (setq-default js2-basic-offset 4)
     (setq-default js2-bounce-indent-p t)
     (setq-default js2-include-node-externs t)
     (setq-default js2-strict-missing-semi-warngin nil)
     (setq-default js2-include-browser-externs nil)
     (setq js2-skip-preprocessor-directives t)))

(provide 'zro-javascript)
