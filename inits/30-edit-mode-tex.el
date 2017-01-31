;;; 30-edit-mode-tex.el --- Major mode for TeX

;;; Commentary:

;;; Code:

(use-package yatex-mode
  :mode (
         ("\\.tex$\\'" . yatex-mode)
         ("\\.ltx$\\'" . yatex-mode)
         ("\\.cls$\\'" . yatex-mode)
         ("\\.sty$\\'" . yatex-mode)
         ("\\.clo$\\'" . yatex-mode)
         ("\\.bbl$\\'" . yatex-mode)
         )
  :init
  (add-hook 'yatex-mode-hook
            '(lambda ()
               (setq bibtex-command "pbibtex")
               (setq YaTeX-nervous nil)
               (setq tex-command "platex2pdf")

               ;; preview のオープンコマンド
               (cond
                ((eq system-type 'gnu/linux)
                 (setq dvi2-command "evince"))
                ((eq system-type 'darwin)
                 (setq dvi2-command "open -a Preview")))
               (setq auto-fill-function nil)

               ;; 改行する
               (make-local-variable 'truncate-lines)
               (setq truncate-lines nil)
               )))

;; :config 内で設定しても反映されなかったので
(setq YaTeX-kanji-code nil)

;; outline-mode を使用して，section を折りたたむ
(add-hook 'yatex-mode-hook
          (lambda ()
            (outline-minor-mode t)
            (setq outline-minor-mode-prefix "\C-c")
            (setq outline-regexp
                  (concat "[ \t]*\\\\\\(documentstyle\\|documentclass\\|"
                          "chapter\\|section\\|subsection\\|subsubsection\\)"
                          "\\*?[ \t]*[[{]"))))

(with-eval-after-load 'outline
  (bind-key "<tab>" 'org-cycle outline-minor-mode-map)
  (bind-key "C-<tab>" 'org-global-cycle outline-minor-mode-map))

;;; 30-edit-mode-tex.el ends here
