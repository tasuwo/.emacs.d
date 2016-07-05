;;; 20-ace-jump-mode.el --- enabling fast/direct cursor movement in current view

;;; Commentary:

;;; Code:

(use-package ace-jump-mode
  :init
  (bind-key "C-c SPC" 'ac-jump-mode)
  :config
  (autoload
    'ace-jump-mode
    "ace-jump-mode"
    "Emacs quick move minor mode"
    t))

;;; 20-ace-jump-mode.el ends here
