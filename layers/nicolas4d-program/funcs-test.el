(defun tags-company/find-environment-test()
  "test finction tags-company/find-environment."
  (let (return)

    (print "")

    ;;no tags environment test
    (tags-company/unset-environment)
    (setq return (tags-company/find-environment))
    (if (eq return nil)
        (print "no tags environment test succeed")
      (error "no tags environment test failed"))

    ;; have tags environment test
    (tags-company/set-environment)
    (setq return (tags-company/find-environment))
    (if return
        (print '"have tags environment test succeed")
      (error "have tags environment test failed"))
    (tags-company/unset-environment)

    nil))

(tags-company/find-environment-test)

