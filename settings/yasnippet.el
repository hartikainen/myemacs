(require 'yasnippet)

(setq yas-snippet-dirs
      (list
       "~/.emacs.d/snippets" ;; personal snippets
       (format
        "~/.emacs.d/elpa/yasnippet-snippets-%s/snippets"
        (mapconcat 'number-to-string (pkg-info-package-version 'yasnippet-snippets) "."))
       ))

(global-set-key (kbd "M-RET") 'yas-expand)


(defun python-split-args (arg-string)
  "Split a python argument string into ((name, default)..) tuples"
  (mapcar (lambda (x)
             (split-string x "[[:blank:]]*=[[:blank:]]*" t))
          (split-string arg-string "[[:blank:]]*,[[:blank:]]*" t)))

(defun python-args-to-google-docstring (text &optional make-fields)
  "Return a reST docstring format for the python arguments in yas-text."
  (let* ((indent (concat "\n" (make-string (current-column) 32)))
         (args (python-split-args text))
     (nr 0)
         (formatted-args
      (mapconcat
       (lambda (x)
         (concat "   " (nth 0 x)
             (if make-fields (format " ${%d:arg%d}" (incf nr) nr))
             (if (nth 1 x) (concat " \(default " (nth 1 x) "\)"))))
       args
       indent)))
    (unless (string= formatted-args "")
      (concat
       (mapconcat 'identity
          (list "" "Args:" formatted-args)
          indent)
       "\n"))))

(yas-global-mode 1)
