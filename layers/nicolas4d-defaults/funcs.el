;;;; rmail
(defun get-email-password-from-authinfo()
  "get email password from ~/.authinfo."
  (save-excursion
    (let (begPoint
          endPoint
          password)
      ;; prepare .authinfo
      (set-buffer (find-file-noselect "~/.authinfo"))
      (beginning-of-buffer)

      ;; get password
      (search-forward-regexp "nicolas4d")
      (search-forward-regexp "password")
      (forward-word)
      (setq endPoint (point))
      (backward-word)
      (setq begPoint (point))
      (copy-region-as-kill begPoint endPoint)
      (setq password (car kill-ring)
            kill-ring (cdr kill-ring)
            )

      ;; kill buffer .authinfo
      (kill-buffer (current-buffer))
      password)))

;;;; rmail ends here
