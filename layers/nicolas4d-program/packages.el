;;; packages.el --- nicolas4d-program layer packages file for Spacemacs.
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
;; added to `nicolas4d-program-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `nicolas4d-program/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `nicolas4d-program/pre-init-PACKAGE' and/or
;;   `nicolas4d-program/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst nicolas4d-program-packages
  '(
    ;;(etags-select :location (recipe :fetcher github :repo "emacsmirror/etags-select"))
    counsel-etags
    ;;helm-etags-plus
    ;;ac-etags
    (tags-company :location (recipe :fetcher github :repo "nicolas4d/tags-company"))
    )
  "The list of Lisp packages required by the nicolas4d-program layer.

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

(defun nicolas4d-program/init-etags-select ()
  (use-package etags-select
    :init
    (progn
      (define-key evil-normal-state-map (kbd "gf")
        (lambda () (interactive) (find-tag (find-tag-default-as-regexp))))

      (define-key evil-normal-state-map (kbd "gb") 'pop-tag-mark)

      (define-key evil-normal-state-map (kbd "gn")
        (lambda () (interactive) (find-tag last-tag t)))

      (evilified-state-evilify etags-select-mode etags-select-mode-map)
      (spacemacs/set-leader-keys-for-major-mode 'js2-mode
        "gd" 'etags-select-find-tag-at-point))))

(defun nicolas4d-program/init-counsel-etags ()
  (use-package counsel-etags
    :init))

(defun nicolas4d-program/init-helm-etags-plus()
  (use-package helm-etags-plus
    :init))

(defun nicolas4d-program/init-ac-etags()
  (use-package ac-etags
    :init))

(defun nicolas4d-program/init-tags-company()
  (use-package tags-company
    :init
    ))

;;; packages.el ends here
