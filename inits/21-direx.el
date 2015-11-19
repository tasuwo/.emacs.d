
;;; Code:
;;; http://cx4a.blogspot.jp/2011/12/popwineldirexel.html

(use-package direx)

(setq direx:leaf-icon "  "
      direx:open-icon "▾ "
      direx:closed-icon "▸ ")

;; direx:direx-modeのバッファをウィンドウ左辺に幅25でポップアップ
;; :dedicatedにtを指定することで、direxウィンドウ内でのバッファの切り替えが
;; ポップアップ前のウィンドウに移譲される
(push '(direx:direx-mode :position left :width 30 :dedicated t)
      popwin:special-display-config)

;;; 21-direx.el ends here
