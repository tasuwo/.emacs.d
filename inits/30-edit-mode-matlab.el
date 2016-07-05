;;; 30-edit-mode-matlab.el --- Edit mode for matlab

;;; Commentary:

;;; Code:
;;; http://d.hatena.ne.jp/uhiaha888/20100815/1281888552

;; 起動時に設定をロードする
(autoload 'matlab-mode "matlab" "Enter Matlab mode." t)
(autoload 'matlab-shell "matlab" "Interactive MATLAB mode." t)

;; 適用ファイル
(setq auto-mode-alist (cons '("\\.m$" . matlab-mode) auto-mode-alist))

;; auto-complete-modeの自動起動
(add-to-list 'ac-modes 'matlab-mode)

(setq matlab-shell-command "/Applications/MATLAB_R2014a.app/bin/matlab"
      matlab-indent-level 4
      matlab-indent-function-body nil
      matlab-highlight-cross-function-variables t
      matlab-return-add-semicolon t
      matlab-mode-install-path (list (expand-file-name "~/.emacs.d/elisp/matlab/"))
      )

(add-hook 'matlab-shell-mode-hook 'ansi-color-for-comint-mode-on)
(add-hook 'matlab-shell-mode-hook
          (lambda () (setenv "LANG" "C")))

(eval-after-load "shell"
  '(define-key shell-mode-map [down] 'comint-next-matching-input-from-input))
(eval-after-load "shell"
  '(define-key shell-mode-map [up] 'comint-previous-matching-input-from-input))

;;; 30-edit-mode-matlab.el ends here
