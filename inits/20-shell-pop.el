;;; 20-shell-pop.el --- シェルを pop 表示する

;;; Commentary:

;;; Code:

(use-package shell-pop
  :init
  ;; ansi-term の設定
  (defadvice ansi-term (after advise-ansi-term-coding-system)
    (set-buffer-process-coding-system 'utf-8-unix 'utf-8-unix))
  (ad-activate 'ansi-term)
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
              (setq show-trailing-whitespace nil)))

  :config
  (custom-set-variables
   ;; custom-set-variables was added by Custom.
   ;; If you edit it by hand, you could mess it up, so be careful.
   ;; Your init file should contain only one such instance.
   ;; If there is more than one, they won't work right.
   '(shell-pop-shell-type (quote ("ansi-term" "*shell-pop-ansi-term*" (lambda nil (ansi-term shell-pop-term-shell)))))
   '(shell-pop-term-shell "/usr/local/bin/zsh")
   '(shell-pop-window-size 30)
   '(shell-pop-full-span t)
   '(shell-pop-window-position "bottom"))
  )

;;; 20-shell-pop.el ends here
