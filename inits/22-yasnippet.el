;;; 20-yasnippet.el --- Yasnippet is awesome

;;; Commentary:

;;; Code:

(use-package yasnippet
  :requires auto-complete
  :init
  (add-hook 'auto-complete-mode-hook 'yas-global-mode)
  :config
  ;; パスを通す
  (yas-load-directory (concat root-dir "snippets"))
  ;; 追加テンプレート
  (setq yas-snippet-dirs
        '("~/.emacs.d/snippets/mySnippets"
          "~/.emacs.d/snippets/matlab-snippets"
          "~/.emacs.d/snippets/yasnippet-snippets"))

  ;; add syntaxes for lisp function
  (add-to-list 'yas/key-syntaxes "(w_.)" t)

  ;; save position before yasnippet execution
  (defun yas/my-save-marker ()
    (setq yas/my-pre-marker (point-marker))
    (setq yas/my-post-marker (set-marker (make-marker) (1+ (point)))))
  (add-hook 'yas/before-expand-snippet-hook 'yas/my-save-marker)

  ;; auto-complete
  (setq-default ac-sources
                (append '(ac-source-features
                          ac-source-yasnippet
                          ac-source-functions
                          ac-source-variables
                          ac-source-symbols)
                        ac-sources)))

;;; 20-yasnippet.el ends here
