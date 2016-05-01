
;;; Code:

(require 'swift-mode)
(require 'auto-complete-swift)

(add-hook 'swift-mode-hook
          '(lambda()
             (setq flycheck-swift-sdk-path
                   (replace-regexp-in-string
                    "\n+$" "" (shell-command-to-string
                               "xcrun --show-sdk-path --sdk macosx")))
             (local-set-key "\C-c\C-c" 'quickrun)
             (local-set-key "\C-c\C-a" 'quickrun-with-arg)
             (add-to-list 'flycheck-checkers 'swift)
             (push 'ac-source-swift-complete ac-sources)
  )
)

;;; 30-edit-mode-swift.el ends here
