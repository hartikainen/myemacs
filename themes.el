(when (> emacs-major-version 23)
  (load-theme 'monokai t)
  )

;; (when (<= emacs-major-version 23)
;;   (add-to-list 'load-path "../path/to/color-theme.el/file")
;;   (require 'color-theme)
;;   (eval-after-load "color-theme"
;;     '(progn
;;        (color-theme-initialize)
;;        (color-theme-hober)))
;;   )
