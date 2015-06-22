
;;; Code:

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
;;; python
(add-hook 'python-mode-hook
          '(lambda()
             (setq indent-tabs-mode t)
             (setq indent-level 4)
             (setq python-indent 4)
             (setq tab-width 4)))


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


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; php
;; (require 'php-mode)
;; (add-hook 'php-mode-hook
;;           (lambda ()
;;             (require 'php-completion)
;;             (php-completion-mode t)
;;             (define-key php-mode-map (kbd "C-o") 'phpcmp-complete)
;;             (make-local-variable 'ac-sources)
;;             (setq ac-sources '(
;;                                ac-source-words-in-same-mode-buffers
;;                                ac-source-php-completion
;;                                ac-source-filename
;;                                                               ))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; web-mode
(require 'web-mode)
;;; 適用する拡張子
(add-to-list 'auto-mode-alist '("\\.phtml$"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php$" . web-mode))
(add-to-list 'auto-mode-alist '("\\.jsp$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x$"   . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb$"       . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?$"     . web-mode))
(add-to-list 'auto-mode-alist '("\\.php?$"      . web-mode))
(defun web-mode-hook ()
  "Hooks for Web mode."
  ;; インデント
  (setq web-mode-markup-indent-offset 2) ;; html indent
  (setq web-mode-css-indent-offset 2)    ;; css indent
  (setq web-mode-code-indent-offset 2)   ;; script indent(js,php,etc..)
  ;; タグの自動補完
  ;0=no auto-closing
  ;1=auto-close with </
  ;2=auto-close with > and </
  (setq web-mode-enable-auto-closing t)
  (setq web-mode-auto-close-style 2)
  (setq web-mode-tag-auto-close-style 2)
  ;;css,js,php,etc..の範囲をbg色で表示
  (setq web-mode-enable-block-faces t)
  (custom-set-faces
    '(web-mode-server-face
      ((t (:background "grey"))))                  ; template Blockの背景色
    '(web-mode-css-face
      ((t (:background "grey18"))))                ; CSS Blockの背景色
    '(web-mode-javascript-face
      ((t (:background "grey36"))))                ; javascript Blockの背景色
  )
  (setq web-mode-enable-heredoc-fontification t)
  )
;; 色の設定
(custom-set-faces
 '(web-mode-doctype-face
   ((t (:foreground "#82AE46"))))                          ; doctype
 '(web-mode-html-tag-face
   ((t (:foreground "#E6B422" :weight bold))))             ; 要素名
 '(web-mode-html-attr-name-face
   ((t (:foreground "#C97586"))))                          ; 属性名など
 '(web-mode-html-attr-value-face
   ((t (:foreground "#82AE46"))))                          ; 属性値
 '(web-mode-comment-face
   ((t (:foreground "#D9333F"))))                          ; コメント
 '(web-mode-server-comment-face
   ((t (:foreground "#D9333F"))))                          ; コメント
 '(web-mode-css-rule-face
   ((t (:foreground "#A0D8EF"))))                          ; cssのタグ
 '(web-mode-css-pseudo-class-face
   ((t (:foreground "#FF7F00"))))                          ; css 疑似クラス
 '(web-mode-css-at-rule-face
   ((t (:foreground "#FF7F00"))))                          ; cssのタグ
 )
(add-hook 'web-mode-hook  'web-mode-hook)


;;; 00-mode.el ends here
