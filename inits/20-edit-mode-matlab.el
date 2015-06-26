
;;; Code:

(autoload 'matlab-mode "matlab" "Enter Matlab mode." t)

(setq auto-mode-alist (cons '("\\.m$" . matlab-mode) auto-mode-alist))
(add-hook 'matlab-mode-hook
          '(lambda ()
             (set-buffer-file-coding-system 'sjis-dos))) ;; M-ファイルはシフトJISで開く

(setq matlab-shell-command "/Applications/MATLAB_R2012a_Student.app/bin/matlab"  ;; bashにパス通しても上手くいかなかったので
      matlab-indent-level 2  ;; ここら辺は好みでどうぞ
      matlab-indent-function-body nil
      matlab-highlight-cross-function-variables t
      matlab-return-add-semicolon t
      matlab-show-mlint-warnings t
      mlint-programs '("/Applications/MATLAB_R2012a_Student.app/bin/maci64/mlint")
      matlab-mode-install-path (list (expand-file-name "~/.emacs.d/elisp/matlab/"))
      )

(autoload 'mlint-minor-mode "mlint" nil t)
(add-hook 'matlab-mode-hook (lambda () (mlint-minor-mode 1)))
(add-hook 'matlab-shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'matlab-shell-mode-hook
          (lambda () (setenv "LANG" "C")))
(eval-after-load "shell"
  '(define-key shell-mode-map [down] 'comint-next-matching-input-from-input))
(eval-after-load "shell"
  '(define-key shell-mode-map [up] 'comint-previous-matching-input-from-input))

;;; 20-edit-mode-matlab.el ends here
