;;; 20-editorconfig.el --- emacs の editorconfig プラグイン

;;; Commentary:

;;; Code:

(use-package editorconfig
  :init
  (add-hook 'prog-mode-hook (editorconfig-mode 1))
  (add-hook 'text-mode-hook (editorconfig-mode 1))
  :config
  (setq edconf-exec-path "/usr/local/bin/editorconfig")
  (add-to-list 'editorconfig-indentation-alist
               ;; A pair of major-mode symbol and its indentation variable
               '(c-mode c-basic-offset)))

;;; 20-editorconfig.el ends here
