
;;; Code:

(use-package flycheck)
(use-package flycheck-tip)

(flycheck-tip-use-timer 'verbose)

(add-hook 'after-init-hook #'global-flycheck-mode)

;; (use-package flycheck-pos-tip)
;; flycheck-pos-chip の設定
;; (with-eval-after-load 'flycheck
;;   (flycheck-pos-tip-mode))
;; (setq flycheck-display-errors-function
;;       'flycheck-display-error-messages-unless-error-list)

;; ;; php-mode
(add-hook 'php-mode-hook 'flycheck-mode)

;;; 20-flycheck.el ends here
