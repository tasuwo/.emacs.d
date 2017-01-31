;;; 30-edit-mode-lisp.el --- lisp の編集環境

;;; Commentary:

;; require SBCL
(setq inferior-lisp-program "sbcl")

(use-package slime
  :config
  (progn
    (slime-setup '(slime-repl slime-fancy slime-banner))
    (slime-setup '(slime-fancy slime-company))))

;; (use-package slime
;;   :config
;;   (company-mode t)
;;   (setq inferior-lisp-program "sbcl")
;;   (setq slime-contribs '(slime-fancy))
;;   (use-package slime-company
;;     :config
;;     (slime-setup '(slime-fancy slime-company))
;;     (message "AAAAAA")))

;;; Code:

;;; 30-edit-mode-lisp.el ends here
