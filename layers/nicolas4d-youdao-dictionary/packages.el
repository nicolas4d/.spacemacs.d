;;; packages.el --- nicolas4d-youdao-dictionary layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2017 Sylvain Benner & Contributors
;;
;; Author: D <d@d-Lenovo-IdeaPad-Y470>
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
;; added to `nicolas4d-youdao-dictionary-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `nicolas4d-youdao-dictionary/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `nicolas4d-youdao-dictionary/pre-init-PACKAGE' and/or
;;   `nicolas4d-youdao-dictionary/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst nicolas4d-youdao-dictionary-packages
  '(
    youdao-dictionary
    )
  "The list of Lisp packages required by the nicolas4d-youdao-dictionary layer.

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

(defun nicolas4d-youdao-dictionary/init-youdao-dictionary ()
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


;;; packages.el ends here
