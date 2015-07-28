
;;; Code:

(require 'flycheck)

(flycheck-mode t)

(add-hook 'after-init-hook #'global-flycheck-mode)

;; flycheck-pos-chip の設定
(eval-after-load 'flycheck
  '(custom-set-variables
       '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))

;;; 20-flycheck.el ends here
