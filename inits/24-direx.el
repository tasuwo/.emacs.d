;;; 24-direx.el --- ディレクトリツリーの表示

;;; Commentary:

;; ディレクトリツリーを表示する
;; http://cx4a.blogspot.jp/2011/12/popwineldirexel.html

;;; Code:

(use-package direx
  :config
  (setq direx:leaf-icon "  "
        direx:open-icon "▾ "
        direx:closed-icon "▸ ")
  ;; direx:direx-modeのバッファをウィンドウ左辺に幅25でポップアップ
  ;; :dedicatedにtを指定することで、direxウィンドウ内でのバッファの切り替えが
  ;; ポップアップ前のウィンドウに移譲される
  (push '(direx:direx-mode :position left :width 30 :dedicated t)
        popwin:special-display-config)
  ;; プロジェクトの root を考慮して direx を起動
  ;; http://blog.shibayu36.org/entry/2013/02/12/191459
  (defun direx:jump-to-project-directory ()
    (interactive)
    (let ((result (ignore-errors
                    (direx-project:jump-to-project-root-other-window)
                    t)))
      (unless result
        (direx:jump-to-directory-other-window)))))

;;; 24-direx.el ends here
