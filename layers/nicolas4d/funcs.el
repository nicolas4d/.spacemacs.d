;;layout
(defun nicolas4d/load-my-layout ()
  (interactive)
  (persp-load-state-from-file (concat persp-save-dir "d-layout")))

(defun nicolas4d/save-my-layout ()
  (interactive)
  (persp-save-state-to-file (concat persp-save-dir "d-layout")))

;;project open
(defun nicolas4d/open-file-with-projectile-or-counsel-git ()
  (interactive)
  (if (nicolas4d/git-project-root)
      (counsel-git)
    (if (projectile-project-p)
        (projectile-find-file)
      (counsel-file-jump))))

(defun nicolas4d/git-project-root ()
  "Return the project root for current buffer."
  (let ((directory default-directory))
    (locate-dominating-file directory ".git")))
