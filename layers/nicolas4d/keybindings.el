;; alter set-mark-command
(if (string= system-type "window-nt")
    ((global-unset-key (kbd "C-SPC"))
     (global-set-key (kbd "M-SPC") 'set-mark-command)
     ))
