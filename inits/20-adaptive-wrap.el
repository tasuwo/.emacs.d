;;; 20-adaptive-wrap.el --- いい感じに改行する

;;; Commentary:
;; 改行表示の際に，改行位置を段落に合わせる
;;
;; 通常:
;; >  - abcde
;; >fg
;; adaptive-wrap:
;; >  - abcde
;; >    fg

;;; Code:

(use-package adaptive-wrap
  :init
  (add-hook 'visual-line-mode-hook
            (lambda ()
              (adaptive-wrap-prefix-mode +1)
              (diminish 'visual-line-mode)))
  :config
  (setq-default adaptive-wrap-extra-indent 0)
  (global-visual-line-mode +1))

;;; 20-adaptive-wrap.el ends here
