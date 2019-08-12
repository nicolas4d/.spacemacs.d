(defvar nicolas4d/tag-company-config ".TAGS_CONF"
  "tag-company-configuration files")

(defun nicolas4d/tags-project-root()
  (let ((directory default-directory))
    (locate-dominating-file directory nicolas4d/tag-company-config)
    )
  )

(defun nicolas4d/setup-tags-project-environment ()
  (if (nicolas4d/tags-project-root)
      (setq tags-table-list (list (nicolas4d/tags-project-root)))
    (setq tags-table-list nil)
    )
  )

(defun nicolas4d/create-tags-if-needed (SRC-DIR &optional FORCE)
  "return the full path of tags file"
  (let ((dir (file-name-as-directory (file-truename SRC-DIR)))
        file)
    (setq file (concat dir "TAGS"))
    (when (spacemacs/system-is-mswindows)
      (setq dir (substring dir 0 -1)))
    (when (or FORCE (not (file-exists-p file)))
      (message "Creating TAGS in %s ..." dir)
      (shell-command
       (format "ctags -f %s -e -R %s" file dir)))
    file))

(defun nicolas4d/update-tags ()
  (interactive)
  "check the tags in tags-table-list and re-create it"
  (nicolas4d/setup-tags-project-environment)
  (dolist (tag tags-table-list)
    (make-thread (nicolas4d/create-tags-if-needed (file-name-directory tag) t))))

(advice-add 'save-buffer :after #'nicolas4d/update-tags)
