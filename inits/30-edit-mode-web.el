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
         ("\\.css\\'" . css-mode))
  :init
  (add-hook 'web-mode-hook
            '(lambda ()
               ;; Auto indent
               (local-set-key (kbd "RET") 'newline-and-indent)

               (setq web-mode-enable-auto-pairing t
                     web-mode-enable-auto-opening t
                     web-mode-enable-auto-indentation t
                     web-mode-enable-block-face t
                     web-mode-enable-part-face t
                     web-mode-enable-comment-keywords t
                     web-mode-enable-css-colorization t
                     web-mode-enable-current-element-highlight t
                     web-mode-enable-heredoc-fontification t
                     web-mode-enable-engine-detection t

                     ;; indent
                     web-mode-markup-indent-offset 2 ;; html
                     web-mode-attr-indent-offset 2
                     web-mode-css-indent-offset 2    ;; css
                     web-mode-code-indent-offset 4   ;; other code (js,php,ruby,...)
                     indent-tabs-mode nil

                     web-mode-style-padding 2
                     web-mode-script-padding 2
                     web-mode-block-padding 0
                     web-mode-comment-style 2)
               ))
  :config
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
  )

(add-hook 'css-mode-hook
          '(lambda ()
             (define-key css-mode-map (kbd "M-i") 'helm-css-scss)
             (setq css-indent-offset 2)
             (rainbow-delimiters-mode t)))

(add-hook 'less-css-mode-hook
          '(lambda ()
             (use-package skewer-less)
             (skewer-less-mode)
             (define-key css-mode-map (kbd "M-i") 'helm-css-scss)
             (rainbow-delimiters-mode t)))

;;; 30-edit-mode-web.el ends here
