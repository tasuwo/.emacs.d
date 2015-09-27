
;;; Code:

(require 'swift-mode)

(custom-set-variables
 '(swift-indent-offset 4)
 '(swift-indent-multiline-statement-offset 1)
)

(add-hook 'swift-mode-hook
  '(lambda()
    (local-set-key "\C-c\C-c" 'quickrun)
    (local-set-key "\C-c\C-a" 'quickrun-with-arg)
  )
)

;;; 30-edit-mode-swift.el ends here
