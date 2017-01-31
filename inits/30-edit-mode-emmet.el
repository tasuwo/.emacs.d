;;; 30-edit-mode-emmet.el

;;; Commentary:

;;; Code:

(use-package emmet-mode
  :init
  (add-hook 'web-mode-hook 'emmet-mode)
  (add-hook 'css-mode-hook 'emmet-mode)
  :config
  (setq emmet-indentation 2)
  (setq emmet-move-cursor-between-quotes nil)
  (setq emmet-move-cursor-after-expanding t))

;;; 30-edit-mode-emmet.el ends here
