
;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; php
;; (require 'php-mode)
;; (add-hook 'php-mode-hook
;;           (lambda ()
;;             (require 'php-completion)
;;             (php-completion-mode t)
;;             (define-key php-mode-map (kbd "C-o") 'phpcmp-complete)
;;             (make-local-variable 'ac-sources)
;;             (setq ac-sources '(
;;                                ac-source-words-in-same-mode-buffers
;;                                ac-source-php-completion
;;                                ac-source-filename
;;                                                               ))))
(require 'php-mode)
(add-hook 'php-mode-hook
          '(lambda()
             (require 'php-completion)
             (setq tab-width 4)
             (setq indent-tabs-mode false)
             (setq c-basic-offset 4)
             (flymake-mode t)
             (setq php-mode-force-pear t)
             (require 'php-completion)
             (php-completion-mode t)
             (make-local-variable 'ac-sources)
             (add-to-list 'ac-sources 'ac-source-php-completion)
             (add-to-list 'ac-sources 'ac-source-filename)))

;;; 30-edit-mode-php.el ends here
