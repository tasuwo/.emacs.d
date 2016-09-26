;;; 31-flycheck.el --- Flycheck

;;; Commentary:

;;; Code:

(use-package flycheck
  :init
  (use-package flycheck-tp
    :config
    (define-key your-prog-mode (kbd "C-c C-n") 'flycheck-tip-cycle)
    ;; To avoid echoing error message on minibuffer (optional)
    (setq flycheck-display-errors-function 'ignore))
  :config
  (global-flycheck-mode)

  ;; matlab
  (flycheck-define-command-checker 'matlab-mlint
    "A Matlab checker based on mlint."
    :command `("/Applications/MATLAB_R2014a.app/bin/maci64/mlint" source)
    :error-patterns
    '((warning line-start "L " line " (C " (1+ digit) "): " (message) line-end)
      (warning line-start "L " line " (C " (1+ digit) "-" (1+ digit) "): " (message) line-end))
    :modes '(matlab-mode))
  (add-to-list 'flycheck-checkers 'matlab-mlint 'append)

  ;; swift
  (setq flycheck-swift-sdk-path
        (replace-regexp-in-string
         "\n+$" "" (shell-command-to-string
                    "xcrun --show-sdk-path --sdk macosx")))
  (add-to-list 'flycheck-checkers 'swift)

  ;; C++
  (setq-default flycheck-clang-language-standard "c++11"
                flycheck-gcc-language-standard "c++11")

  ;; javascript
  (setq-default flycheck-temp-prefix ".")
  (setq flycheck-eslintrc "~/.eslintrc")
  (setq-default flycheck-disabled-checkers
                (append flycheck-disabled-checkers
                        '(javascript-jshint)))
  (setq flycheck-checkers '(javascript-eslint))
  ;; use eslint with web-mode for jsx files
  (flycheck-add-mode 'javascript-eslint 'web-mode)
  (flycheck-add-mode 'javascript-eslint 'js2-mode)
  (flycheck-add-mode 'javascript-eslint 'js-mode)
  ;; disable json-jsonlist checking for json files
  (setq-default flycheck-disabled-checkers
                (append flycheck-disabled-checkers
                        '(json-jsonlist))))

;;; 31-flycheck.el ends here
