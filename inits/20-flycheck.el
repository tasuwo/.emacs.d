
;;; Code:

(use-package flycheck)

(flycheck-mode t)

(add-hook 'after-init-hook #'global-flycheck-mode)

;; flycheck-pos-chip の設定
(eval-after-load 'flycheck
  '(custom-set-variables
       '(flycheck-display-errors-function #'flycheck-pos-tip-error-messages)))

;; swift-mode
(add-to-list 'flycheck-checkers 'swift)
(add-hook 'swift-mode-hook
          '(lambda()
             (add-to-list 'flycheck-checkers 'swift)
             (setq flycheck-swift-sdk-path
                   (replace-regexp-in-string
                    "\n+$" "" (shell-command-to-string
                               "xcrun --show-sdk-path --sdk macosx")))
             )
          )

;; php-mode
(add-hook 'php-mode-hook 'flycheck-mode)

;;; 20-flycheck.el ends here
