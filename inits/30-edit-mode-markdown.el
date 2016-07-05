;;; 30-edit-mode-markdown.el --- Edit mode for markdown

;;; Commentary:

;;; Code:

;; 起動時に設定をロードする
(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)

;; 適用ファイル
(add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . gfm-mode))

;; ファイル内容を標準入力で渡すのではなく、ファイル名を引数として渡すように設定
(defun markdown-custom ()
  "markdown-mode-hook"
  (setq markdown-command-needs-filename t))
(add-hook 'markdown-mode-hook
          '(lambda()
             (company-mode nil)
             (ad-activate 'auto-complete-mode)
             (toggle-truncate-lines nil)
             (define-key markdown-mode-map (kbd "C-i") 'markdown-cycle)
             (hide-sublevels 2)
             (markdown-custom)))
(add-hook 'gfm-mode-hook
          '(lambda ()
             (markdown-custom)
             (ad-activate 'auto-complete-mode)
             (setq global-linum-mode nil)
             (electric-indent-local-mode -1)))

;;; 30-edit-mode-markdown ends here
