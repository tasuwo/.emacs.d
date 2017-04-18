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

  ;; ref https://github.com/amperser/proselint/issues/37
  ;; textlint
  (flycheck-define-checker textlint
    "A linter for prose."
    :command ("textlint" "--format" "unix" source)
    :error-patterns
    ((warning line-start (file-name) ":" line ":" column ": "
              (id (one-or-more (not (any " "))))
              (message (one-or-more not-newline)
                       (zero-or-more "\n" (any " ") (one-or-more not-newline)))
              line-end))
    :modes (text-mode markdown-mode gfm-mode))
  (add-to-list 'flycheck-checkers 'textlint 'append)

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
  (flycheck-swift-setup)
  (setq flycheck-swift-sdk-path
        (replace-regexp-in-string
         "\n+$" "" (shell-command-to-string
                    "xcrun --show-sdk-path --sdk macosx")))
  (add-to-list 'flycheck-checkers 'swift 'append)

  ;; C++
  (add-hook 'c++-mode-hook
            (lambda ()
              (setq flycheck-clang-language-standard "c++11")))
  ;; (setq-default flycheck-clang-language-standard "c++11"
  ;;               flycheck-gcc-language-standard "c++11")

  ;; javascript
  (setq flycheck-checkers '(javascript-eslint))
  (setq-default flycheck-temp-prefix ".")
  (setq flycheck-eslintrc "~/.eslintrc")
  ;; use eslint with web-mode, js2-mode js2-jsx-mode for jsx files
  (flycheck-add-mode 'javascript-eslint 'web-mode)
  (flycheck-add-mode 'javascript-eslint 'js2-mode)
  (flycheck-add-mode 'javascript-eslint 'js2-jsx-mode)
  (add-hook 'web-mode-hook 'flycheck-mode)
  (add-hook 'js2-mode-hook 'flycheck-mode)
  (add-hook 'js2-jsx-mode-hook 'flycheck-mode)
  ;; disable jshint since we prefer eslint checking
  (setq-default flycheck-disabled-checkers
                (append flycheck-disabled-checkers
                        '(javascript-jshint)))
  ;; disable json-jsonlist checking for json files
  (setq-default flycheck-disabled-checkers
                (append flycheck-disabled-checkers
                        '(json-jsonlist)))

  ;; (use-package flycheck-pos-tip
  ;;   :config
  ;;   (flycheck-pos-tip-mode))
  )

;;; 31-flycheck.el ends here
