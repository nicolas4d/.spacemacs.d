;;window-nt
(if (string= system-type "windows-nt")
    (set-default-font "-outline-SimSun-normal-normal-normal-*-13-*-*-*-p-*-iso10646-1")
  )

(delete-selection-mode t)

;;abbrev
(define-abbrev-table 'global-abbrev-table '(
                                            ("n4d" "nicolas4d")
                                            ))

(setq-default fill-column 75)

;;;; mail

;;; sending mail
(setq smtpmail-smtp-server "smtp.qq.com"
      smtpmail-smtp-service 25
      user-full-name "nicolas4d"
      user-mail-address "nicolas4d@foxmail.com"
      )

;;;rmail
;; Configure IMAP
;; (setq rmail-primary-inbox-list (list "imap://nicolas4d@imap.qq.com")
;;       rmail-movemail-variant-in-use 'mailutils
;;       rmail-remote-password-required t
;;       )

;; configure pop3
(setq rmail-remote-password-required t
      rmail-remote-password (get-email-password-from-authinfo)
      rmail-movemail-variant-in-use 'mailutils
      rmail-primary-inbox-list (list "pop://nicolas4d@pop.qq.com")
      ;;rmail-primary-inbox-list '("pop://nicolas4d@qq.com") ;; this line is not working
      rmail-summary-line-count-flag nil
      rmail-file-name "~/emacs/.rmail"
      )

;; highlight and activate URLs:
(add-hook 'rmail-show-message-hook 'goto-address-mode)

;;;; mail ends here
