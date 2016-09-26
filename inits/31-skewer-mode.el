;;; 31-skewer-mode.el --- HTML,CSS,JS をブラウザにリアルタイムに描画する

;;; Commentary:

;;; Code:

(use-package skewer-mode
  :init
  (add-hook 'js2-mode-hook 'skewer-mode)
  (add-hook 'css-mode-hook 'skewer-css-mode)
  (add-hook 'html-mode-hook 'skewer-html-mode))

;; 31-skewer-mode.el ends here
