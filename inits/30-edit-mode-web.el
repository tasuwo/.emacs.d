;;; 30-edit-mode-web.el --- Web major mode

;;; Commentary:
;;; https://git.framasoft.org/distopico/distopico-dotemacs/blob/23808ab57054e29e7d71fb3a77af928ce6f59627/emacs/modes/web-mode.el

;;; Code:

(use-package web-mode
  :mode (("\\.tpl\\'" . web-mode)
         ("\\.as[cp]x\\'" . web-mode)
         ("\\.djhtml\\'" . web-mode)
         ("\\.*tml\\'" . web-mode)
         ("\\.*tpl\\'" . web-mode)
         ("\\.html?\\'" . web-mode)
         ("\\.ctp\\'" . web-mode)
         ("\\.css\\'" . web-mode))
  :init
  ;; 開いたファイルの拡張子に応じて ac-sources を設定
  (setq web-mode-ac-sources-alist
      ;; '(("php" . (  ac-source-php-auto-yasnippets
      ;;               ac-source-gtags
      ;;               ac-source-words-in-same-mode-buffers
      ;;               ac-source-words-in-buffer
      ;;               ac-source-files-in-current-dir
      ;;  ))
        '(("html" . ( ac-source-emmet-html-aliases
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

  ;; 現在カーソルが存在する言語に適した ac-source をロードする
  (add-hook 'web-mode-before-auto-complete-hooks
            '(lambda ()
               (let ((web-mode-cur-language
                      (web-mode-language-at-pos)))
                 ;; php にカーソルがあれば
                 (if (string= web-mode-cur-language "php")
                     (yas-activate-extra-mode 'php-mode)
                   (yas-deactivate-extra-mode 'php-mode))
                 ;; css にカーソルがあれば
                 (if (string= web-mode-cur-language "css")
                     (setq emmet-use-css-transform t)
                   (setq emmet-use-css-transform nil)))))

  (add-hook 'web-mode-hook
            '(lambda ()
               ;; ----- auto-complete ----- ;;
               (set (make-local-variable 'ac-sources)
                    (setq ac-sources '(ac-source-filename
                                       ac-source-yasnippet)))
               ;; (sdd-to-list 'ac-sources 'a)
               ;; Auto indent
               (local-set-key (kbd "RET") 'newline-and-indent)
               ;; Disabled smartparens in web-mode
               ;; (setq smartparens-mode nil)
               ))
  :config
  (setq web-mode-engines-alist '(
    ("php" . "\\.phtml\\'")
    ("blade" . "\\.blade\\'")
    ("django" . "\\.[sd]tpl\\'")
    ("django" . "\\.[sd]tml\\'")))

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
              web-mode-comment-style 2)

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
          :foreground "#FF8A4B"))))))

(use-package emmet-mode
  :init
  (add-hook 'web-mode-hook 'emmet-mode)
  (add-hook 'css-mode-hook 'emmet-mode)
  (add-hook 'web-mode-hook
            (lambda ()
              (use-package ac-emmet
                :config
                (ac-emmet-html-setup))))
  (add-hook 'css-mode-hook
            (lambda ()
              (use-package ac-emmet
                :config
                (ac-emmet-css-setup))))
  (add-hook 'css-mode-hook
          '(lambda ()
             (setq ac-sources (append '(ac-source-emmet-css-snippets) ac-sources))
             (setq ac-sources (append '(ac-source-emmet-css-snippets ac-source-css-property) ac-sources))))
  :config
  (setq emmet-indentation 2)
  (setq emmet-move-cursor-between-quotes nil)
  (setq emmet-move-cursor-after-expanding t))

(add-hook 'css-mode-hook
          '(lambda ()
             (define-key css-mode-map (kbd "M-i") 'helm-css-scss)
             (rainbow-delimiters-mode t)))

(add-hook 'less-css-mode-hook
          '(lambda ()
             (use-package skewer-less)
             (skewer-less-mode)
             (define-key css-mode-map (kbd "M-i") 'helm-css-scss)
             (rainbow-delimiters-mode t)))

;;; 30-edit-mode-web.el ends here
