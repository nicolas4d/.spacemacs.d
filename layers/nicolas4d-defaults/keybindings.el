;; expand-regions
(global-set-key (kbd "C-=") 'er/expand-region)

;;iedit
(global-set-key (kbd "M-s e") 'iedit-mode)

;;youdao-dictionary
(spacemacs/set-leader-keys "dy" 'youdao-dictionary-search-at-point+)

;; alter set-mark-command
(if (string= system-type "window-nt")
    ((global-unset-key (kbd "C-SPC"))
     (global-set-key (kbd "M-SPC") 'set-mark-command)
     ))

(global-set-key "\C-x\C-b" 'buffer-menu)

;;; evil
(define-key evil-motion-state-map (kbd "C-e") nil)
(define-key evil-motion-state-map (kbd "C-v") nil)
(define-key evil-motion-state-map (kbd "C-d") nil)
(define-key evil-motion-state-map (kbd "C-f") nil)
(define-key evil-motion-state-map (kbd "C-y") nil)

(define-key evil-normal-state-map (kbd "q") nil)
(define-key evil-normal-state-map (kbd "C-p") nil)
(define-key evil-normal-state-map (kbd "C-n") nil)
;;; evil ends here
