;;; 30-edit-mode-tex.el --- Major mode for TeX

;;; Commentary:

;;; Code:

(use-package yatex-mode
  :mode (("\\.tex$\\'" . yatex-mode))
  :init
  (add-hook 'yatex-mode-hook
            '(lambda ()
               (setq auto-fill-function nil)))
  :config
  (setq tex-command "platex")
  (setq bibtex-command "pbibtex")
  (setq YaTeX-nervous nil)
  (setq tex-command "platex2pdf")

  ;; preview のオープンコマンド
  (cond
   ((eq system-type 'gnu/linux)
    (setq dvi2-command "evince"))
   ((eq system-type 'darwin)
    (setq dvi2-command "open -a Preview"))))

;;; 30-edit-mode-tex.el ends here
