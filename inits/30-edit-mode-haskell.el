;;; 30-edit-mode-haskell.el --- Edit mode for haskell

;;; Commentary:
;;; > http://hikaru515.hatenablog.com/entry/2016/09/12/021206#company-for-haskell

;;; Code:

(use-package haskell-mode
  :mode (("\\.hs\\'" . haskell-mode)
         ("\\.lhs\\'" . haskell-mode)
         ("\\.cadal\\'" . haskell-mode))
  :init
  (add-hook 'haskell-mode-hook
            '(lambda ()
               ;; インデント
               (turn-on-haskell-indentation)
               (turn-on-haskell-doc-mode)
               (font-lock-mode)
               (imenu-add-menubar-index)
               ;; GHCi のコマンドを設定
               (setq haskell-program-name "/usr/bin/stack ghci") ;; stack の場合
               (inferior-haskell-mode)
               ;; ghc-mod を使えるように
               (ghc-init))))
