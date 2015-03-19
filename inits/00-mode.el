
;;; Code:
;; markdown
(autoload 'markdown-mode "markdown-mode" "Major mode for editing Markdown files" t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . gfm-mode))
;; ファイル内容を標準入力で渡すのではなく、ファイル名を引数として渡すように設定
(defun markdown-custom ()
  "markdown-mode-hook"
  (setq markdown-command-needs-filename t)
    )
(add-hook 'markdown-mode-hook '(lambda() (markdown-custom)))
(add-hook 'gfm-mode-hook
          '(lambda ()
             (markdown-custom)
             (setq global-linum-mode nil)
             (electric-indent-local-mode -1)))

;; C/C++
(defun my-c-c++-mode-init ()
  (setq c-basic-offset 4)
)
(add-hook 'c-mode-hook 'my-c-c++-mode-init)
(add-hook 'c++-mode-hook 'my-c-c++-mode-init)

;;; 00-mode.el ends here
