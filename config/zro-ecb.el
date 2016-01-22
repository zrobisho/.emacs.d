;; ECB stuff

(require 'ecb)
;;(require 'ecb-autoloads)

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

(provide 'zro-ecb)
