
;;; Code:

(setq flycheck-swift-sdk-path
      (replace-regexp-in-string
       "\n+$" "" (shell-command-to-string
                  "xcrun --show-sdk-path --sdk macosx")))

(require 'swift-mode)
(require 'auto-complete-swift)
(push 'ac-source-swift-complete ac-sources)

(add-to-list 'flycheck-checkers 'swift)
(add-hook 'swift-mode-hook
  '(lambda()
    (local-set-key "\C-c\C-c" 'quickrun)
    (local-set-key "\C-c\C-a" 'quickrun-with-arg)
    (add-to-list 'flycheck-checkers 'swift)
  )
)

;;; 30-edit-mode-swift.el ends here
