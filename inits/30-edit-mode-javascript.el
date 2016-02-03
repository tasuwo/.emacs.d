
;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; js2-mode
(use-package js2-mode)
(use-package js2-refactor)
(use-package js2-imenu-extras)
(use-package tern)

(autoload 'js2-mode "js2-mode" nil t)
(add-to-list 'auto-mode-alist '("\.js$" . js2-mode))
(setq js-indent-level 2)
(add-hook 'js2-mode-hook
          (lambda ()
            (tern-mode t)))

(eval-after-load 'tern
   '(progn
      (require 'tern-auto-complete)
      (tern-ac-setup)))

;; Formating beautify
(eval-after-load 'js2-mode
  '(define-key js2-mode-map (kbd "C-c C-b f") 'web-beautify-js))
(eval-after-load 'json-mode
  '(define-key json-mode-map (kbd "C-c C-b f") 'web-beautify-js))
(eval-after-load 'web-mode
  '(define-key html-mode-map (kbd "C-c C-b f") 'web-beautify-html))
(eval-after-load 'css-mode
  '(define-key css-mode-map (kbd "C-c C-b f") 'web-beautify-css))

;;; 30-edit-mode-javascript.el ends here
