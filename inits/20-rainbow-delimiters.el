;;; 20-rainbow-delimiters.el --- 括弧の組を綺麗に表示する

;;; Commentary:

;;; Code:

(use-package rainbow-delimiters
  :init
  (add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
  :config
  ;; 括弧の色を強調する設定
  (use-package cl-lib
    :ensure t)
  (use-package color
    :ensure t)

  (defun rainbow-delimiters-using-stronger-colors ()
    (interactive)
    (cl-loop
     for index from 1 to rainbow-delimiters-max-face-count
     do
     (let ((face (intern (format "rainbow-delimiters-depth-%d-face" index))))
       (cl-callf color-saturate-name (face-foreground face) 30))))
  (add-hook 'emacs-startup-hook
            'rainbow-delimiters-using-stronger-colors))

;;; 20-rainbow-delimiters.el ends here

