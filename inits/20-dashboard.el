;;; 10-dashboard.el ---

;;; Commentray

;;; Code:

(use-package dashboard
  :ensure t
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-banner-logo-title "Hide This with Me")
  (setq dashboard-startup-banner "~/.emacs.d/mito.png")
  (setq initial-buffer-choice (lambda () (get-buffer "*dashboard*"))))
