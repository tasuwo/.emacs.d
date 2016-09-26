;;; 23-popwin.el --- Emacs のためのポップアップウインドウマネージャ

;;; Commentary:

;; ヘルプバッファや補完バッファをポップアップしてくれる
;; M-x describe-function とかの際に勝手に画面が分割されたりしないようにする
;; デフォルトでは *Help*, *Completions*, *compilatoin*, *Occur* がポップアップする

;;; Code:

(use-package popwin
  :config
  (setq display-buffer-function 'popwin:display-buffer)
  (setq popwin:popup-window-position 'bottom)

  (push '("\\*magit:" :regexp t :position bottom :height 70) popwin:special-display-config))

;;; 23-popwin.el ends here
