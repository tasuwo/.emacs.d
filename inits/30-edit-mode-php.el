;;; 30-edit-mode-php.el --- Major mode for php

;;; Commentary:

;;; Code:
(setq package-archives
        '(("melpa" . "https://melpa.org/packages/")) )
  (package-initialize)
  (unless (package-installed-p 'ac-php )
    (package-refresh-contents)
    (package-install 'ac-php))

(use-package php-mode
  :mode (("\\.php$\\'" . php-mode))
  :init
  (add-hook 'php-mode-hook
            '(lambda()
               (setq php-mode-force-pear t)
               (setq c-basic-offset 4)
               (c-set-offset 'case-label' 4)
               (c-set-offset 'arglist-cont-nonempty' 4)
               (defun ywb-php-lineup-arglist-intro (langelem)
                 (save-excursion
                   (goto-char (cdr langelem))
                   (vector (+ (current-column) c-basic-offset))))
               (defun ywb-php-lineup-arglist-close (langelem)
                 (save-excursion
                   (goto-char (cdr langelem))
                   (vector (current-column))))
               (c-set-offset 'arglist-intro 'ywb-php-lineup-arglist-intro)
               (c-set-offset 'arglist-close 'ywb-php-lineup-arglist-close)
               (c-set-offset 'inlambda' 0)
               (c-set-offset 'inline-open' 0)

               ;; -------- auto-complete --------
               (set (make-local-variable 'ac-sources)
                    (setq ac-sources '(ac-source-filename
                                       ac-source-words-in-same-mode-buffers
                                       ac-source-semantic
                                       ac-source-yasnippet)))
               ;; 補完
               ;; (use-package php-completion
               ;;   :init
               ;;   (php-completion-mode t)
               ;;   ;; (define-key php-mode-map (kbd "C-o") 'phpcmp-complete)
               ;;   (add-to-list 'ac-sources 'ac-source-php-completion))
               (use-package ac-php
                 :init
                 (add-to-list 'ac-sources 'ac-source-php)
                 ;; (define-key php-mode-map  (kbd "C-]") 'ac-php-find-symbol-at-point)   ;goto define
                 ;; (define-key php-mode-map  (kbd "C-t") 'ac-php-location-stack-back) ; go back
                 )
               ;; ------ end auto-complete ------
               )))

;;; 30-edit-mode-php.el ends here
