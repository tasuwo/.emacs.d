;;; 20-smarparents.el --- 括弧のペアを補完するマイナーモード

;;; Commentary:

;; 括弧のペアを補完する．
;; 選択範囲内に括弧を付加したりも出来る．

;;; Code:

(use-package smartparens-config
  :config
  (smartparens-global-mode t)
  ;; (add-hook 'js-mode-hook #'smartparens-mode)
  )

;;; 20-smartparens.el ends here
