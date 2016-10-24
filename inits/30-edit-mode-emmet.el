;;; 30-edit-mode-emmet.el

;;; Commentary:

;;; Code:

(use-package emmet-mode
  :init
  (add-hook 'web-mode-hook 'emmet-mode)
  (add-hook 'css-mode-hook 'emmet-mode)
  (add-hook 'web-mode-hook
            (lambda ()
              (use-package ac-emmet
                :config
                (ac-emmet-html-setup))))
  (add-hook 'css-mode-hook
            (lambda ()
              (use-package ac-emmet
                :config
                (ac-emmet-css-setup))))
  (add-hook 'css-mode-hook
          '(lambda ()
             (setq ac-sources (append '(ac-source-emmet-css-snippets) ac-sources))
             (setq ac-sources (append '(ac-source-emmet-css-snippets ac-source-css-property) ac-sources))))
  :config
  (setq emmet-indentation 2)
  (setq emmet-move-cursor-between-quotes nil)
  (setq emmet-move-cursor-after-expanding t))

;;; 30-edit-mode-emmet.el ends here
