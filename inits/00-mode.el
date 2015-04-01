
;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; pukiwiki
(load-library "pukiwiki-mode")
(setq pukiwiki-auto-insert t)
(autoload 'pukiwiki-edit
  "pukiwiki-mode" "pukwiki-mode." t)
(autoload 'pukiwiki-index
  "pukiwiki-mode" "pukwiki-mode." t)
(autoload 'pukiwiki-edit-url
  "pukiwiki-mode" "pukwiki-mode." t)
(setq
 pukiwiki-site-list
 '(("selab"
    "http://selpm.cis.ibaraki.ac.jp/~selab/pukiwiki/index.php"
    nil euc-jp-dos)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; markdown
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; C/C++
(defun my-c-c++-mode-init ()
  (setq c-basic-offset 4)
)
(add-hook 'c-mode-hook 'my-c-c++-mode-init)
(add-hook 'c++-mode-hook 'my-c-c++-mode-init)


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; slime
;; デフォルトの Common Lisp 処理系
;(setq inferior-lisp-program "ccl")     ; Clozure CL
(setq inferior-lisp-program "clisp")   ; CLISP
;; SLIMEのロード
(require 'slime)
;; SLIMEからの入力をUTF-8に設定
(setq slime-net-coding-system 'utf-8-unix)
(slime-setup '(slime-repl slime-fancy slime-banner slime-indentation))


;;; 00-mode.el ends here
