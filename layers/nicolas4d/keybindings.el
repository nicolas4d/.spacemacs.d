;; alter set-mark-command
(if (string= system-type "window-nt")
    ((global-unset-key (kbd "C-SPC"))
     (global-set-key (kbd "M-SPC") 'set-mark-command)
     ))

(spacemacs/set-leader-keys "dll" 'nicolas4d/load-my-layout)
(spacemacs/set-leader-keys "dls" 'nicolas4d/save-my-layout)
(spacemacs/set-leader-keys "pf" 'nicolas4d/open-file-with-projectile-or-counsel-git)

;;; Rebind 'C-x C-b' for 'buffer-menu'
(global-set-key "\C-x\C-b" 'buffer-menu)

