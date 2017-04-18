;;; 30-edit-mode-gfm.el --- Edit mode for markdown

;;; Commentary:

;;; Code:

(use-package gfm-mode
  :init
  (add-hook 'gfm-mode-hook 'flycheck-mode))

(use-package markdown-mode
  :mode (("\\.md\\'" . gfm-mode)
         ("\\.markdown\\'" . gfm-mode))
  :init
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
               ))
  :config
  (use-package mmm-mode
    :config
    (setq mmm-global-mode 'maybe)
    (setq mmm-parse-when-idle 't)

    (defun my-mmm-gfm-auto-class (lang &optional submode)
      "Define a mmm-mode class for LANG in `gfm-mode' using SUBMODE.
If SUBMODE is not provided, use `LANG-mode' by default."
      (let ((class (intern (concat "gfm-" lang)))
            (submode (or submode (intern (concat lang "-mode"))))
            (front (concat "^```[\s-]*" lang "[\n\r]+"))
            (back "^```"))
        (mmm-add-classes (list (list class :submode submode :front front :back back)))
        (mmm-add-mode-ext-class 'gfm-mode nil class)))

    ;; Mode names that derive directly from the language name
    (mapc 'my-mmm-gfm-auto-class
          '("awk" "bibtex" "c" "cpp" "css" "html" "latex" "lisp" "makefile"
            "markdown" "python" "r" "ruby" "sql" "stata" "emacs-lisp" "java" "json" "swift"))
    ;; Mode names that differ from the language name
    (my-mmm-gfm-auto-class "fortran" 'f90-mode)
    (my-mmm-gfm-auto-class "javascript" 'js2-mode)
    (my-mmm-gfm-auto-class "php" 'web-mode)
    (my-mmm-gfm-auto-class "perl" 'cperl-mode)
    (my-mmm-gfm-auto-class "shell" 'shell-script-mode))

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
