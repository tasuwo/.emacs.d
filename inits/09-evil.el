;;; 09-evil.el --- Extensible Vi Layer = EViL

;;; Commentary:

;; Emacs の Vim 風拡張
;; https://www.emacswiki.org/emacs/Evil

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

;;; 09-evil.el ends here
