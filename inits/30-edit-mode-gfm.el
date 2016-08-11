;;; 30-edit-mode-gfm.el --- Edit mode for markdown

;;; Commentary:

;;; Code:

(use-package markdown-mode
  :mode (("\\.md\\'" . gfm-mode)
         ("\\.markdown\\'" . gfm-mode))
  :config
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

;;; 30-edit-mode-gfm.el ends here
