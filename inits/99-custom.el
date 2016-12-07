
;;; Code:

(setq custom-file "~/.emacs.d/elisp/custom-file.el")
(if (file-exists-p (expand-file-name "~/.emacs.d/elisp/custom-file.el"))
    (load (expand-file-name custom-file) t nil nil))

;; (add-hook 'term-mode-hook 'my-inhibit-global-linum-mode)
;; (add-hook 'term-mode-hook 'my-inhibit-global-whitespace-mode)

;; (defun my-inhibit-global-linum-mode ()
;;   "Counter-act `global-linum-mode'."
;;   (add-hook 'after-change-major-mode-hook
;;             (lambda () (linum-mode 0))
;;             :append :local))

;; (defun my-inhibit-global-whitespace-mode ()
;;   "Counter-act `global-whitespace-mode'."
;;   (add-hook 'after-change-major-mode-hook
;;             (lambda () (whitespace-mode 0) (setq show-trailing-whitespace nil))
;;             :append :local))

;;; 99-custom.el ends here
