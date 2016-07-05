
;;; Code:

;; 起動時に設定をロードする
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)

;; 適用ファイル
(setq auto-mode-alist
  (cons (cons "\\.tex$" 'yatex-mode) auto-mode-alist))

(setq tex-command "platex")
(setq bibtex-command "pbibtex")
(setq YaTeX-nervous nil)
(setq tex-command "platex2pdf")

(cond
  ((eq system-type 'gnu/linux)
    (setq dvi2-command "evince"))
  ((eq system-type 'darwin) ;; Mac なら
    (setq dvi2-command "open -a Preview")))
(add-hook 'yatex-mode-hook '(lambda () (setq auto-fill-function nil)))

;;; 30-edit-mode-tex.el ends here
