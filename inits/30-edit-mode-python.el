;;; 30-edit-mode-python.el

;;; Commentary:

;;; Code:

(use-package python-mode
  :mode (("\\.py\\'" . python-mode))
  :config
  (add-hook 'python-mode-hook
          '(lambda()
             (setq indent-tabs-mode t)
             (setq indent-level 4)
             (setq python-indent 4)
             (setq tab-width 4)))
  (eval-after-load "python"
    '(progn
       (define-key python-mode-map (kbd "C-c C-d") 'helm-pydoc))))

;;; 30-edit-mode-python.el ends here
