;;; 20-smarparents.el --- 括弧のペアを補完するマイナーモード

;;; Commentary:

;; 括弧のペアを補完する．
;; 選択範囲内に括弧を付加したりも出来る．

;;; Code:

(use-package smartparens-config
  :config
  (show-smartparens-global-mode t))

(add-hook 'emacs-lisp-mode-hook #'smartparens-mode)
(add-hook 'swift-mode-hook #'smartparens-mode)
(add-hook 'python-mode-hook #'smartparens-mode)
(add-hook 'c-mode-hook #'smartparens-mode)
(add-hook 'c++-mode-hook #'smartparens-mode)
(add-hook 'php-mode-hook #'smartparens-mode)
(add-hook 'web-mode-hook #'smartparens-mode)
(add-hook 'js2-mode-hook #'smartparens-mode)
(add-hook 'gfm-mode-hook #'smartparens-mode)
(add-hook 'gfm-mode-hook
          (lambda ()
            (sp-with-modes 'gfm-mode
              (sp-local-pair "`" nil :actions nil))
            ))
(add-hook 'web-mode-hook
          (lambda ()
            (sp-with-modes 'web-mode
              (sp-local-pair "<" nil :actions nil))
            ))

;;; 20-smartparens.el ends here
