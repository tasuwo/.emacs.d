;;; 09-evil.el --- Extensible Vi Layer = EViL

;;; Commentary:

;; Emacs の Vim 風拡張
;; https://www.emacswiki.org/emacs/Evil

;;; Code:

(defun pasteboard-copy()
  "Copy region to OS X system pasteboard."
  (interactive)
  (shell-command-on-region
   (region-beginning) (region-end) "pbcopy")
  (keyboard-quit))
(defun pasteboard-paste()
  "Paste from OS X system pasteboard via `pbpaste' to point."
  (interactive)
  (shell-command-on-region
   (point) (if mark-active (mark) (point)) "pbpaste" nil t))
(defun pasteboard-cut()
  "Cut region and put on OS X system pasteboard."
  (interactive)
  (pasteboard-copy)
  (delete-region (region-beginning) (region-end)))

(use-package evil
  :config
  (evil-mode 1)
  (setq evil-want-C-u-scroll t)
  (setq evil-normal-state-msg  "NORMAL"
        evil-insert-state-msg  "INSERT"
        evil-replace-state-msg "REPLAC"
        evil-emacs-state-msg   "EMACS"
        evil-visual-state-msg  "VISUAL")

  ;; ターミナル上の Emacs でコピペを行う
  (unless window-system
    (progn
      (define-key evil-normal-state-map (kbd "p") 'pasteboard-paste)
      (define-key evil-visual-state-map (kbd "d") 'pasteboard-cut)
      (define-key evil-visual-state-map (kbd "c") 'pasteboard-cut)
      (define-key evil-visual-state-map (kbd "y") 'pasteboard-copy)
      ))
  )

;;; 09-evil.el ends here
