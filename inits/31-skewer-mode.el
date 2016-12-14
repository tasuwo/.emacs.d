;;; 31-skewer-mode.el --- HTML,CSS,JS をブラウザにリアルタイムに描画する

;;; Commentary:

;;; Code:

(use-package skewer-mode
  :init
  (add-hook 'web-mode-hook 'skewer-html-mode)
  (add-hook 'js2-mode-hook 'skewer-mode)
  (add-hook 'css-mode-hook 'skewer-css-mode)
  (add-hook 'html-mode-hook 'skewer-html-mode)
  :config
  (use-package simple-httpd
    :config
    (setq httpd-root "/Users/tozawa/GoogleDrive/site")))

;; 31-skewer-mode.el ends here
