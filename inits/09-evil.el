
;;; Code:

(require 'evil)
(evil-mode 1)

(require 'evil-mode-line)
(require 'mode-line-color)
(mode-line-color-mode)

(setq evil-normal-state-msg  "NORMAL"
      evil-insert-state-msg  "INSERT"
      evil-replace-state-msg "REPLAC"
      evil-emacs-state-msg   "EMACS"
      evil-visual-state-msg  "VISUAL")

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
         :foreground "black"))))
  )

;;; 10-evil.el ends here
