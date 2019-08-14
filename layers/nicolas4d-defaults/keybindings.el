;; expand-regions
(global-set-key (kbd "C-=") 'er/expand-region)

;;iedit
(global-set-key (kbd "M-s e") 'iedit-mode)

;;occur
(global-set-key (kbd "M-s o") 'occur-dwim)

;;youdao-dictionary
(spacemacs/set-leader-keys "dy" 'youdao-dictionary-search-at-point+)
