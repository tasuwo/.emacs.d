;;; 20-shell-pop.el --- シェルを pop 表示する

;;; Commentary:

;;; Code:

(use-package shell-pop
  :init
  ;; ansi-term の設定
  (defvar ansi-term-after-hook nil)
  (add-hook 'ansi-term-after-hook
            (lambda ()
              ;; C-t で line-mode と char-mode を切り替える
              (define-key term-raw-map  my-ansi-term-toggle-mode-key 'my-term-switch-line-char)
              (define-key term-mode-map my-ansi-term-toggle-mode-key 'my-term-switch-line-char)))
  (evil-set-initial-state 'term-mode 'emacs)
  (add-hook 'term-mode-hook
            (lambda ()
              ;; (defface tmp-buffer-local-face
              ;;   '((t :family "Source Code Pro Regular for Powerline"))
              ;;   "Temporary buffer-local face")
              (buffer-face-set 'tmp-buffer-local-face)
              (linum-mode 0)
              (whitespace-mode 0)
              (evil-emacs-state)
              (setq powerline-utf-8-separator-left        #xe0b0
                    powerline-utf-8-separator-right       #xe0b2
                    airline-utf-glyph-separator-left      #xe0b0
                    airline-utf-glyph-separator-right     #xe0b2
                    airline-utf-glyph-subseparator-left   #xe0b1
                    airline-utf-glyph-subseparator-right  #xe0b3
                    airline-utf-glyph-branch              #xe0a0
                    airline-utf-glyph-readonly            #xe0a2
                    airline-utf-glyph-linenumber          #xe0a1)
              (setq show-trailing-whitespace nil)))

  :config
  (custom-set-variables
   ;; custom-set-variables was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(shell-pop-shell-type (quote ("ansi-term" "*shell-pop-ansi-term*" (lambda nil (ansi-term shell-pop-term-shell)))))
   '(shell-pop-term-shell "/usr/local/bin/zsh")
   '(shell-pop-window-height 40)
   '(shell-pop-window-position "bottom"))
  )

;;; 20-shell-pop.el ends here
