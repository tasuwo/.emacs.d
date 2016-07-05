;;; 30-edit-mode-coffee.el --- Edit mode for coffee script

;;; Commentary:

;;; Code:

(use-package coffee-mode
  :mode (("\\.coffee\\'" . coffee-mode))
  :config
  (add-hook 'coffee-mode-hook
            (lambda ()
              (custom-set-variables
               '(coffee-tab-width 2)
               '(coffee-args-compile '("-c" "--no-header" "--bare")))))
  (eval-after-load "coffee-mode"
    '(progn
       (define-key coffee-mode-map [(meta r)] 'coffee-compile-buffer)
       (define-key coffee-mode-map (kbd "C-j") 'coffee-newline-and-indent))))

;;; 30-edit-mode-coffee.el ends here
