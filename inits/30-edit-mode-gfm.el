;;; 30-edit-mode-gfm.el --- Edit mode for markdown

;;; Commentary:

;;; Code:

(use-package markdown-mode
  :mode (("\\.md\\'" . gfm-mode)
         ("\\.markdown\\'" . gfm-mode))
  :init
  (add-hook 'gfm-mode-hook 'flycheck-mode)
  (add-hook 'markdown-mode-hook
            '(lambda ()
               ;; ヘッダの色と文字の設定をつける
               (custom-set-faces
                '(markdown-header-delimiter-face ((t (:inherit org-mode-line-clock))))
                '(markdown-header-face-1 ((t (:inherit outline-1 :weight bold))))
                '(markdown-header-face-2 ((t (:inherit outline-2 :weight bold))))
                '(markdown-header-face-3 ((t (:inherit outline-3 :weight bold))))
                '(markdown-header-face-4 ((t (:inherit outline-4 :weight bold))))
                '(markdown-header-face-5 ((t (:inherit outline-5  :weight bold))))
                '(markdown-header-face-6 ((t (:inherit outline-6  :weight bold))))
                '(markdown-pre-face ((t (:inherit org-formula))))
                )
               (setq markdown-fontify-code-blocks-natively t)
               (setq markdown-css-paths `(,mkdown-css-file-name)o)
               ))
  :config
  (setq markdown-command "marked")

  ;; 改行のために必要
  (add-hook 'visual-line-mode-hook
            '(lambda()
               (setq truncate-lines nil)))

  ;; ファイル内容を標準入力で渡すのではなく、ファイル名を引数として渡すように設定
  (defun markdown-custom ()
    "gfm-mode-hook"
    (setq markdown-command-needs-filename t))
  (add-hook 'gfm-mode-hook
            '(lambda ()
               (markdown-custom)
               (setq truncate-lines nil)
               (setq global-linum-mode nil)
               (define-key markdown-mode-map (kbd "C-i") 'markdown-cycle)
               (hide-sublevels 2)
               (electric-indent-local-mode -1))))

(walk-windows (lambda (window)
                (set-window-hscroll window 1)))

(use-package markdown-preview-eww)

;;; 30-edit-mode-gfm.el ends here
