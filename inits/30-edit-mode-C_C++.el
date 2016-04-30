
;;; Code:

(defun my-c-c++-mode-init ()
  (setq-default c-basic-offset 2
                tab-width 2
                indent-tabs-mode nil)
)
(add-hook 'c-mode-hook 'my-c-c++-mode-init)
(add-hook 'c++-mode-hook 'my-c-c++-mode-init)

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; C++ style
(defun add-c++-mode-conf ()
  (c-set-style "stroustrup")
  (show-paren-mode t))
(add-hook 'c++-mode-hook 'add-c++-mode-conf)
;; C style
(defun add-c-mode-common-conf ()
  (c-set-style "stroustrup")
  (show-paren-mode t))
(add-hook 'c-mode-common-hook 'add-c-mode-common-conf)

;; doxymacs
(require 'doxymacs)
(setq doxymacs-doxygen-style "JavaDoc")
(add-hook 'c-mode-hook 'doxymacs-mode)
(add-hook 'c++-mode-hook 'doxymacs-mode)

;;; 30-edit-mode-C_C++.el ends here
