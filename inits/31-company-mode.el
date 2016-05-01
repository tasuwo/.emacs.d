
;;; Code:

(require 'company)
(add-hook 'after-init-hook 'global-company-mode)
(setq company-backends (delete 'company-semantic company-backends))

(global-company-mode +1)
(company-quickhelp-mode +1)

;; 自動補完をoff
(custom-set-variables
 '(company-idle-delay nil))

;; 補完のソース
(add-to-list 'company-backends 'company-c-headers)
;; (add-to-list 'company-c-headers-path-system "/usr/include/c++/4.8/")

;;; 31-company-mode.el ends here
