;;; 30-edit-mode-swift.el --- Major mode for swift

;;; Commentary:

;;; Code:

(use-package swift-mode
  :mode (("\\.swift$\\'" . swift-mode))
  :init
  (add-hook 'swift-mode-hook
            '(lambda()
               (auto-complete-mode t)
               (set (make-local-variable 'ac-sources)
                    (setq ac-sources '(ac-source-filename
                                       ac-source-yasnippet)))
               (use-package auto-complete-swift
                 :config
                 (add-to-list 'ac-sources 'ac-source-swift-complete))
               (local-set-key "\C-c\C-c" 'quickrun)
               (local-set-key "\C-c\C-a" 'quickrun-with-arg))))

;;; 30-edit-mode-swift.el ends here
