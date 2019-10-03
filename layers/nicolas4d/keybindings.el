(load-file "~/.emacs.d/init-keybindings.el")

;;layout
(spacemacs/set-leader-keys "dll" 'nicolas4d/load-my-layout)
(spacemacs/set-leader-keys "dls" 'nicolas4d/save-my-layout)

;;porject open
(spacemacs/set-leader-keys "pf" 'nicolas4d/open-file-with-projectile-or-counsel-git)

;;occur
(global-set-key (kbd "M-s o") 'occur-dwim)

