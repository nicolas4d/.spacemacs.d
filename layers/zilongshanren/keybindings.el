;; 开启行号显示
(global-linum-mode t)

;; 定义快捷键
(global-set-key (kbd "M-s o") 'occur-dwim)

;; 将 occur 的 buffer 中的光标移动方式修改为 HJKL
(evilified-state-evilify-map occur-mode-map
  :mode occur-mode)
