
;;; Code:

(use-package flycheck)

(add-hook 'after-init-hook #'global-flycheck-mode)

(use-package flycheck-tip)

(flycheck-tip-use-timer 'verbose)

;;;;;;;;;;;;;
;; matlab
(add-hook 'matlab-mode-hook
          (flycheck-define-command-checker 'matlab-mlint
            "A Matlab checker based on mlint."
            :command `("/Applications/MATLAB_R2014a.app/bin/maci64/mlint" source)
            :error-patterns
            '((warning line-start "L " line " (C " (1+ digit) "): " (message) line-end)
              (warning line-start "L " line " (C " (1+ digit) "-" (1+ digit) "): " (message) line-end))
            :modes '(matlab-mode))
          (add-to-list 'flycheck-checkers 'matlab-mlint 'append))

;;;;;;;;;
;; swift
(add-hook 'swift-mode-hook
          '(lambda()
             (setq flycheck-swift-sdk-path
                   (replace-regexp-in-string
                    "\n+$" "" (shell-command-to-string
                               "xcrun --show-sdk-path --sdk macosx")))
             (add-to-list 'flycheck-checkers 'swift)))

;;;;;;;;;;;;;
;; php-mode
(add-hook 'php-mode-hook 'flycheck-mode)

;;; 31-flycheck.el ends here
