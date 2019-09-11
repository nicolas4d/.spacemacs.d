;;; packages.el --- nicolas4d-defaults layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: d <d@d-c>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `nicolas4d-defaults-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `nicolas4d-defaults/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `nicolas4d-defaults/pre-init-PACKAGE' and/or
;;   `nicolas4d-defaults/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst nicolas4d-defaults-packages
  '(
    youdao-dictionary
    company
    dired
    hungry-delete
    plantuml
    web-mode
    yasnippet
    helm-ag
    cdlatex
    )
  "The list of Lisp packages required by the nicolas4d-defaults layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(defun nicolas4d-defaults/init-youdao-dictionary ()
  (progn
    (defvar use-package--warning1221
      (function
       (lambda
         (keyword err)
         (let
             ((msg
               (format "%s/%s: %s" 'youdao-dictionary keyword
                       (error-message-string err))))
           (display-warning 'use-package msg :error)))))
    (condition-case err
        (progn
          (condition-case err
              (if
                  (run-hook-with-args-until-failure 'use-package--youdao-dictionary--pre-init-hook)
                  (progn
                    (run-hooks 'use-package--youdao-dictionary--post-init-hook)))
            ((debug error)
             (funcall use-package--warning1221 :init err)))
          (if
              (not
               (require 'youdao-dictionary nil t))
              (display-warning 'use-package
                               (format "Cannot load %s" 'youdao-dictionary)
                               :error)))
      ((debug error)
       (funcall use-package--warning1221 :catch err))))
  )

(defun nicolas4d-defaults/post-init-company()
  )

(defun nicolas4d-defaults/post-init-dired()
  (use-package dired
    :config
    (setq dired-recursive-deletes 'always)

    (put 'dired-find-alternate-file 'disabled nil)
    ;; 主动加载 Dired Mode
    ;; (require 'dired)
    ;; (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file)
    ;; 延迟加载
    (with-eval-after-load 'dired
      (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))
    ))

(defun nicolas4d-defaults/post-init-hungry-delete()
  (global-hungry-delete-mode))

(defun nicolas4d-defaults/post-init-plantuml()
  (setq org-plantuml-jar-path
        (expand-file-name "/home/d/.spacemacs.d/plantuml.jar"))
  (setq plantuml-jar-path
        (expand-file-name "/home/d/.spacemacs.d/plantuml.jar")))

(defun nicolas4d-defaults/post-init-web-mode()
  ;;(add-to-list 'auto-mode-alist '("\\.js?\\'" . web-mode))
  )

(defun nicolas4d-defaults/post-init-yasnippet()
  (use-package yasnippet
    :config
    (define-key yas-minor-mode-map (kbd "TAB") yas-maybe-expand)
    ;;(define-key yas-minor-mode-map (kbd "C-c y") #'yas-expand)
    ;;(define-key yas-minor-mode-map (kbd "C-c C-n") #'yas-new-snippet)
    ;;(define-key yas-minor-mode-map (kbd "C-c C-v") #'yas-visit-snippet-file)
    ))

(defun nicolas4d-defaults/init-helm-ag()
  (use-package helm-ag
    :init
    (define-key evil-motion-state-map (kbd "SPC f a") 'helm-ag)

    ;;; for remove warning when emacs statup commented below in .emacs.d/elpa/helm-core.../helm.el
    ;;(defvaralias 'helm-split-window-in-side-p 'helm-split-window-inside-p)
    ))

(defun nicolas4d-defaults/init-cdlatex()
  (use-package cdlatex
    :init
    ))
;;; packages.el ends here
