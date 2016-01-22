(require 'nodejs-repl)
(require 'linum)

(setq nodejs-repl-arguments '("debug" "/Users/ZacharyRobichaud/nodeMusic/index.js"))
(setq nodejs-repl-prompt "debug>")

(defun nodejs-debug--send-debug-command(cmd)
  "Send a command to the debugger"
  (comint-send-string "*nodejs*" cmd))

(defun nodejs-debug--current-line()
  "Return the current line number based on where the cursor is in the source buffer"
  (number-to-string (line-number-at-pos)))

(defun nodejs-debug--current-file()
  "Return the current file name from the source buffer. Used for set/clear
Breakpoints"
  (print buffer-file-name))

(defun nodejs-debug--set-breakpoint()
  "Send setBreakpoint command to nodejs debugger using the current line of source code"
  (interactive)
  (nodejs-debug--current-file)
  (nodejs-debug--send-debug-command (concat "setBreakpoint('index.js', " (nodejs-debug--current-line) ")\n")))

(defun nodejs-debug--clear-breakpoint()
  "Clear the breakpoint on the current line"
  (interactive)
  (nodejs-debug-send-debug-command (concat "clearBreakpoint'index.js', " (nodejs-debug--current-line) ")\n")))

(defun nodejs-debug--step()
  (interactive)
  (nodejs-debug--send-debug-command"step\n"))

(defun nodejs-debug--continue()
  (interactive)
  (nodejs-debug--send-debug-command "cont\n"))

(defun nodejs-debug--step-out()
  (interactive)
  (nodejs-debug--send-debug-command "out\n"))

(defun nodejs-debug--next()
  (interactive)
  (nodejs-debug--send-debug-command "next\n"))

(defun nodejs-debug--pause()
  (interactive)
  (nodejs-debug--send-debug-command "pause\n"))

(defun nodejs-debug()
  "Run Node.js Debugger"
  (interactive)
  (setq nodejs-repl-prompt-re
        (format nodejs-repl-prompt-re-format nodejs-repl-prompt nodejs-repl-prompt))
  (let* ((repl-mode (or (getenv "NODE_REPL_MODE") "magic"))
         (nodejs-repl-code (format nodejs-repl-code-format
                                   (window-width) nodejs-repl-prompt repl-mode )))
    (switch-to-buffer-other-window
     (apply 'make-comint nodejs-repl-process-name nodejs-repl-command nil
            `(,@nodejs-repl-arguments )))
    (nodejs-repl-mode)))

(global-set-key (kbd "C-x C-a C-b") 'nodejs-debug--set-breakpoint)
(global-set-key (kbd "C-x C-a C-s") 'nodejs-debug--step)
(global-set-key (kbd "C-x C-a C-c") 'nodejs-debug--continue)
(global-set-key (kbd "C-x C-a C-o") 'nodejs-debug--step-out)
(global-set-key (kbd "C-x C-a C-n") 'nodejs-debug--next)
(global-set-key (kbd "C-x C-a C-p") 'nodejs-debug--pause)
(global-set-key (kbd "<f5>") 'nodejs-debug)

(provide 'zro-nodejs-debug)
