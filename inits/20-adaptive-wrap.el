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

;; 折り返しについて
;; visual-line-mode と longlines-mode というものがあるらしい
;; - visual-line-mode
;;   - 画面幅で決めるらしい?
;; - longlines-mode
;;   - 変数 fill-column で折り返すらしい？

;; http://alainmathematics.blogspot.jp/2013/07/emacs.html

;;; Code:

(use-package adaptive-wrap
  :init
  (dolist
      (hook '(
              gfm-mode-hook
              ))
    (setq-default adaptive-wrap-extra-indent 0)
    (add-hook hook 'adaptive-wrap-prefix-mode)))

;;; 20-adaptive-wrap.el ends here
