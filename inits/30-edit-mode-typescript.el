;;; 30-edit-mode-typescript.el --- Typescript mode

;;; Commentary:

;;; Code:

(use-package typescript-mode
  :mode (("\\.ts\\'" . typescript-mode)))

(use-package tide
  :requires 'flycheck
  :commands (typescript-mode)
  :init     (add-hook 'typescript-mode 'my:tide-init)
  :config
  (defun my:tide-init ()
    (lambda ()
      (tide-setup)
      (flycheck-mode t)
      (setq flycheck-check-syntax-automatically '(save mode-enabled))
      (eldoc-mode t))))

;;; 30-edit-mode-typescript.el ends here
