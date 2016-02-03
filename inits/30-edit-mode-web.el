
;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; web-mode
;;; https://git.framasoft.org/distopico/distopico-dotemacs/blob/23808ab57054e29e7d71fb3a77af928ce6f59627/emacs/modes/web-mode.el
(use-package web-mode)

(add-to-list 'auto-mode-alist '("\\.tpl\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.php\\'" . php-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.*tpl\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.*tml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("/\\(views\\|html\\|templates\\)/.*\\.php\\'" . web-mode))

(setq web-mode-engines-alist '(
    ("php" . "\\.phtml\\'")
    ("blade" . "\\.blade\\'")
    ("django" . "\\.[sd]tpl\\'")
    ("django" . "\\.[sd]tml\\'")))

(add-hook 'web-mode-hook
          '(lambda ()
             ;; Auto indent
             (local-set-key (kbd "RET") 'newline-and-indent)
             ;; Disabled smartparens in web-mode
             ;; (setq smartparens-mode nil)
             ))

(setq-default web-mode-enable-auto-pairing t
              web-mode-enable-auto-opening t
              web-mode-enable-auto-indentation t
              web-mode-enable-block-face t
              web-mode-enable-part-face t
              web-mode-enable-comment-keywords t
              web-mode-enable-css-colorization t
              web-mode-enable-current-element-highlight t
              web-mode-enable-heredoc-fontification t
              web-mode-enable-engine-detection t

              web-mode-markup-indent-offset 2
              web-mode-css-indent-offset 2
              web-mode-code-indent-offset 2

              web-mode-style-padding 2
              web-mode-script-padding 2
              web-mode-block-padding 0
              web-mode-comment-style 2
              )

;; Custom web-mode colors
(custom-set-faces
 '(web-mode-html-tag-face
   ((t (:foreground "#729fcf"))))
 '(web-mode-html-tag-bracket-face
   ((t (:foreground "#FFE84B"))))
 '(web-mode-current-element-highlight-face
   ((t (:foreground "#FF8A4B"))))
 '(web-mode-current-element-highlight-face
   ((t (:background "#000000"
        :foreground "#FF8A4B")))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; zencoding
;; html と css では zencoding をつかう
(use-package emmet-mode)
(use-package ac-emmet)

(setq emmet-indentation 2)
(setq emmet-move-cursor-between-quotes nil)
(setq emmet-move-cursor-after-expanding t)

(add-hook 'web-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook  'emmet-mode)

(add-hook 'web-mode-hook 'ac-emmet-html-setup)
(add-hook 'css-mode-hook 'ac-emmet-css-setup)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;;;;;
;; skewer-mode
(use-package skewer-mode
  :config
  (add-hook 'js2-mode-hook 'skewer-mode)
  (add-hook 'css-mode-hook 'skewer-css-mode)
  (add-hook 'html-mode-hook 'skewer-html-mode))

;; css hook
(add-hook 'css-mode-hook
          '(lambda ()
             (define-key css-mode-map (kbd "M-i") 'helm-css-scss)
             ;;ac-source-css-property
             (setq ac-sources (append '(ac-source-emmet-css-snippets ) ac-sources))
             (rainbow-delimiters-mode t)
                                        ;(rainbow-identifiers-mode t)
             )
          )

(add-hook 'less-css-mode-hook
          '(lambda ()
             (use-package skewer-less)
             (skewer-less-mode)
             (define-key css-mode-map (kbd "M-i") 'helm-css-scss)
             ;;ac-source-css-property
             ;(setq ac-sources (append '(ac-source-emmet-css-snippets ac-source-css-property ) ac-sources))
             (rainbow-delimiters-mode t)
                                        ;(rainbow-identifiers-mode t)
             )
          )

;; Enabled ac-js2
(add-hook 'js2-mode-hook 'ac-js2-mode)
(setq ac-js2-evaluate-calls t)
;; Autocomplete
(add-to-list 'ac-modes 'js2-mode)
(add-to-list 'ac-modes 'web-mode)
(add-to-list 'ac-modes 'css-mode)
(add-to-list 'ac-modes 'less-css-mode)

;;;;;;;;;;;;;;;;;;;;;;;;;;
;; auto-complete 用の設定
(setq web-mode-ac-sources-alist
      '(("php" . (  ac-source-php-auto-yasnippets
                    ac-source-yasnippet
                    ac-source-abbrev
                    ac-source-gtags
                    ac-source-semantic
                    ac-source-dictionary
                    ac-source-words-in-same-mode-buffers
                    ac-source-words-in-buffer
                    ac-source-files-in-current-dir
        ))
        ("html" . ( ac-source-emmet-html-aliases 
                    ac-source-emmet-html-snippets
                    ac-source-yasnippet
                    ac-source-abbrev
                    ac-source-gtags
                    ac-source-semantic
                    ac-source-dictionary
                    ac-source-words-in-same-mode-buffers
                    ac-source-words-in-buffer
                    ac-source-files-in-current-dir
                  ))
        ("css" . (  ac-source-css-property 
                    ac-source-emmet-css-snippets
                    ac-source-yasnippet
                    ac-source-abbrev
                    ac-source-gtags
                    ac-source-semantic
                    ac-source-dictionary
                    ac-source-words-in-same-mode-buffers
                    ac-source-words-in-buffer
                    ac-source-files-in-current-dir
                  ))
        )
)

(add-hook 'web-mode-before-auto-complete-hooks
          '(lambda ()
             (let ((web-mode-cur-language
                    (web-mode-language-at-pos)))
               (if (string= web-mode-cur-language "php")
                   (yas-activate-extra-mode 'php-mode)
                 (yas-deactivate-extra-mode 'php-mode))
               (if (string= web-mode-cur-language "css")
                   (setq emmet-use-css-transform t)
                 (setq emmet-use-css-transform nil))
               )
             )
          )

(provide 'web-mode)

;;; 30-edit-mode-web.el ends here
