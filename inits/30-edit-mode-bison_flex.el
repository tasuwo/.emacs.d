;;; Code:

;; ;;;;
;; bison-mode / flex-mode
;; ;;;;
(autoload 'bison-mode "bison-mode")
;; *.y *.yy ファイルを 自動的に bison-mode にする
(setq auto-mode-alist
     (cons '("\.\(y\|yy\)$" . bison-mode) auto-mode-alist))
(autoload 'flex-mode "flex-mode")
;; *.l *.ll ファイルを 自動的に flex-mode にする
(setq auto-mode-alist
     (cons '("\.\(l\|ll\)$" . flex-mode) auto-mode-alist))

;;; 30-edit-mode-bison_flex.el ends here
