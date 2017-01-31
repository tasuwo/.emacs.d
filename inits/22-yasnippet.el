;;; 22-yasnippet.el --- Emacs のためのテンプレートシステム

;;; Commentary:

;; スニペットを展開してくれる

;;; Code:

(use-package yasnippet
  :config
  ;; パスを通す
  (yas-load-directory (concat root-dir "snippets"))

  ;; 追加テンプレート
  (setq yas-snippet-dirs
        '("~/.emacs.d/snippets/matlab-snippets"
          "~/.emacs.d/snippets/yasnippet-snippets"))

  ;; add syntaxes for lisp function
  (add-to-list 'yas/key-syntaxes "(w_.)" t)

  ;; save position before yasnippet execution
  (defun yas/my-save-marker ()
    (setq yas/my-pre-marker (point-marker))
    (setq yas/my-post-marker (set-marker (make-marker) (1+ (point)))))
  (add-hook 'yas/before-expand-snippet-hook 'yas/my-save-marker)

  (yas-global-mode))

;;; 22-yasnippet.el ends here
