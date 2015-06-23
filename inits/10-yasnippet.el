
;;; Code:

(require 'yasnippet)

;; パスを通す
(yas-load-directory (concat root-dir "snippets"))

;; 追加テンプレート
(setq yas-snippet-dirs
      '("~/.emacs.d/snipetts/mySnippets"
        "~/.emacs.d/snippets/yasnippet-snippets"
       ))

(yas-global-mode 1)

;;; 10-yasnippet.el ends here
