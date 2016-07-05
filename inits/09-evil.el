;;; 09-evil.el --- Extensible Vi Layer for Emacs

;;; Commentary:

;;; Code:

(use-package evil
  :config
  (evil-mode 1)
  (setq evil-want-C-u-scroll t)
  (setq evil-normal-state-msg  "NORMAL"
        evil-insert-state-msg  "INSERT"
        evil-replace-state-msg "REPLAC"
        evil-emacs-state-msg   "EMACS"
        evil-visual-state-msg  "VISUAL"))

(use-package mode-line-mode
  :config (mode-line-color-mode t))

(use-package evil-mode-line
  :requires 'evil
  :requires 'mode-line-mode
  :config
  (custom-set-faces
   '(modeline-evil-normal-state
     ((t (:background "darkolivegreen"
          :foreground "black"))))
   '(modeline-evil-insert-state
     ((t (:background "#500000"
          :foreground "black"))))
   '(modeline-evil-replace-state
     ((t (:background "chocolate1"
          :foreground "black"))))
   '(modeline-evil-visual-state
     ((t (:background "#55295b"
          :foreground "black"))))
   '(modeline-evil-emacs-state
     ((t (:background "gray50"
          :foreground "black"))))))

;;; 09-evil.el ends here
