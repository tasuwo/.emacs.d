;;; 30-edit-mode-swift.el --- Major mode for swift

;;; Commentary:

;;; Code:

(use-package swift-mode
  :init
  (add-hook 'swift-mode-hook
            '(lambda()
               (local-set-key "\C-c\C-c" 'quickrun)
               (local-set-key "\C-c\C-a" 'quickrun-with-arg))))

(use-package auto-complete-swift
  :requires 'auto-complete
  :init
  (add-hook 'swift-mode-hook
            (push 'ac-source-swift-complete ac-sources)))

;;; 30-edit-mode-swift.el ends here
