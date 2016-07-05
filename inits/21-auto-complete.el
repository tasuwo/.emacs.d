;;; 21-auto-complete.el --- Auto completion

;;; Commentary:

;;; Code:

(use-package auto-complete
  :config
  (use-package auto-complete-config)

  (global-auto-complete-mode t)

  ;; 自動補完をon
  (setq ac-auto-start 0)

  ;; use C-n/C-p on the menu
  (setq ac-use-menu-map t)

  ;; fuzzy match
  (setq ac-use-fuzzy t)

  ;; 補完のソース
  (setq-default ac-sources
                '(ac-source-filename
                  ac-source-abbrev
                  ac-source-words-in-same-mode-buffers
                  ac-source-semantic)))

;;;;;;;;;;;;
;; web
(defun ac-web-mode-setup ()
  (setq-default ac-sources my-ac-sources))
(add-hook 'web-mode-hook 'ac-web-mode-setup)
(add-hook 'css-mode-hook
          '(lambda ()
             (setq ac-sources (append '(ac-source-emmet-css-snippets) ac-sources))
             (setq ac-sources (append '(ac-source-emmet-css-snippets ac-source-css-property) ac-sources))))
(use-package node-ac-mode)
(add-hook 'js2-mode-hook
          (lambda ()
            (local-set-key (kbd "C-.") 'node-ac-auto-complete)
            (local-set-key (kbd "C-c C-d") 'node-ac-show-document)
            (local-set-key (kbd "C-c C-j") 'node-ac-jump-to-definition)))
(setq ac-js2-evaluate-calls t)
(add-to-list 'ac-modes 'js2-mode)
(add-to-list 'ac-modes 'web-mode)
(add-to-list 'ac-modes 'css-mode)
(add-to-list 'ac-modes 'less-css-mode)
(setq web-mode-ac-sources-alist
      '(("php" . (  ac-source-php-auto-yasnippets
                    ac-source-gtags
                    ac-source-words-in-same-mode-buffers
                    ac-source-words-in-buffer
                    ac-source-files-in-current-dir
        ))
        ("html" . ( ac-source-emmet-html-aliases
                    ac-source-emmet-html-snippets
                    ac-source-gtags
                    ac-source-words-in-same-mode-buffers
                    ac-source-words-in-buffer
                    ac-source-files-in-current-dir
                  ))
        ("css" . (  ac-source-css-property
                    ac-source-emmet-css-snippets
                    ac-source-gtags
                    ac-source-words-in-same-mode-buffers
                    ac-source-words-in-buffer
                    ac-source-files-in-current-dir
                  ))))

;;; 20-auto-complete.el ends here
