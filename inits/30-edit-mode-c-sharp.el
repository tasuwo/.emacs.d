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
              (c-set-style "ellemtel")
              (local-set-key (kbd "C-c C-c") 'recompile)
              (setq-default c-basic-offset 4
                            tab-width 4
                            c-syntactic-indentation t
                            truncate-lines t
                            evil-shift-width 4
                            indent-tabs-mode nil)
              ;; TODO: Windows には対応していない
              (setq omnisharp-server-executable-path "/usr/local/bin/omnisharp")
              (omnisharp-mode))))
