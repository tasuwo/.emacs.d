
;;; Code:

(setq custom-file "~/.emacs.d/elisp/custom-file.el")
(if (file-exists-p (expand-file-name "~/.emacs.d/elisp/custom-file.el"))
    (load (expand-file-name custom-file) t nil nil))

;;; 99-custom.el ends here
