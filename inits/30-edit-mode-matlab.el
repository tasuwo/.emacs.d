
;;; Code:

(autoload 'matlab-mode "matlab" "Enter Matlab mode." t)
(autoload 'matlab-shell "matlab" "Interactive MATLAB mode." t)
(setq auto-mode-alist (cons '("\\.m$" . matlab-mode) auto-mode-alist))

;; auto-complete-modeの自動起動
(add-to-list 'ac-modes 'matlab-mode)

;;(add-hook 'matlab-mode-hook
;;          '(lambda ()
;;             (set-buffer-file-coding-system 'sjis-dos))) ;; M-ファイルはシフトJISで開く

(setq matlab-shell-command "/Applications/MATLAB_R2014a.app/bin/matlab"  ;; bashにパス通しても上手くいかなかったので
      matlab-indent-level 4  ;; ここら辺は好みでどうぞ
      matlab-indent-function-body nil
      matlab-highlight-cross-function-variables t
      matlab-return-add-semicolon t
      matlab-show-mlint-warnings t
      mlint-programs '("/Applications/MATLAB_R2014a.app/bin/maci64/mlint")
      matlab-mode-install-path (list (expand-file-name "~/.emacs.d/elisp/matlab/"))
      )

;;(eval-after-load 'flycheck
;;  '(require 'flycheck-matlab-mlint))
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