(defun zilongshanren/open-file-with-projectile-or-counsel-git ()
  (interactive)
  (if (zilongshanren/vcs-project-root)
      (counsel-git)
    (if (projectile-project-p)
        (projectile-find-file)
      (ido-find-file))))

;;load layout
(defun nicolas4d/load-my-layout ()
  (interactive)
  (persp-load-state-from-file (concat persp-save-dir "d-layout")))

;;save layout
(defun nicolas4d/save-my-layout ()
  (interactive)
  (persp-save-state-to-file (concat persp-save-dir "d-layout")))
