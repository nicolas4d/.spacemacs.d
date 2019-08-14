;;abbrev
(define-abbrev-table 'global-abbrev-table '(
                                            ("n4d" "nicolas4d")
                                            ))

;;dired
(put 'dired-find-alternate-file 'disabled nil)
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

;;hungry-delete
(global-hungry-delete-mode)

;;plantuml
(setq org-plantuml-jar-path
      (expand-file-name "/home/d/.spacemacs.d/plantuml.jar"))
(setq plantuml-jar-path
      (expand-file-name "/home/d/.spacemacs.d/plantuml.jar"))

;;web-mode
(add-to-list 'auto-mode-alist '("\\.js?\\'" . web-mode))

;;window-nt
(if (string= system-type "windows-nt")
    (set-default-font "-outline-SimSun-normal-normal-normal-*-13-*-*-*-p-*-iso10646-1")
  )

;;delete-selection
(delete-selection-mode t)
