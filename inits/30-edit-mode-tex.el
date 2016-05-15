
;;; Code:

;; 拡張子が .tex なら yatex-mode に
(setq auto-mode-alist
  (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)

(setq tex-command "platex")
(setq bibtex-command "pbibtex")
(setq YaTeX-nervous nil)

(setq tex-command "platex2pdf") ;; 自作したコマンドを
(cond
  ((eq system-type 'gnu/linux)
    (setq dvi2-command "evince"))
  ((eq system-type 'darwin) ;; Mac なら
    (setq dvi2-command "open -a Preview")))
(add-hook 'yatex-mode-hook '(lambda () (setq auto-fill-function nil)))

;;; 30-edit-mode-tex.el ends here
