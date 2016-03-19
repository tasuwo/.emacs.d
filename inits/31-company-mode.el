
;;; Code:

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)

(setq company-backends (delete 'company-semantic company-backends))
(define-key c-mode-map  [(tab)] 'company-complete)
(define-key c++-mode-map  [(tab)] 'company-complete)

(add-to-list 'company-backends 'company-c-headers)

;; (add-to-list 'company-c-headers-path-system "/usr/include/c++/4.8/")

;;; 31-company-mode.el ends here
