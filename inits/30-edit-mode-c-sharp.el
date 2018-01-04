;;; 30-edit-mode-c-sharp.el --- Major mode for C#

;;; Commentary:

;;; code:


(use-package omnisharp-mode
  :init
  (lambda ()))

(use-package csharp-mode
  :mode (("\\.cs\\'" . csharp-mode))
  :init
  (add-hook 'csharp-mode-hook
            (lambda ()
              (setq-default c-basic-offset 4
                            tab-width 4
                            indent-tabs-mode nil)
              (c-set-style "stroustrup")
              ;; TODO: Windows には対応していない
              (setq omnisharp-server-executable-path "/usr/local/bin/omnisharp")
              (omnisharp-mode))))
