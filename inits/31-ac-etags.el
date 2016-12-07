;;; 31-ac-etags.el --- etags の auto-complete

;;; Commentary:

;;; Code:


(setq tags-table-list
      '("~/.emacs.d/TAGS"))

(use-package ac-etags:
  :config
  (custom-set-variables
   '(ac-etags-requires 1))

  (eval-after-load "etags"
    '(progn
       (ac-etags-setup)))
  (add-hook 'c-mode-common-hook 'ac-etags-ac-setup)
  (add-hook 'ruby-mode-common-hook 'ac-etags-ac-setup)
  (add-hook 'emacs-lisp-mode-common-hook 'ac-etags-ac-setup))

;;; 31-ac-etags.el ends here
