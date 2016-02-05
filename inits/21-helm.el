
;;; Code:

(use-package helm-config)
(helm-mode 1)

;; 自動補完を無効
(custom-set-variables '(helm-ff-auto-update-initial-value nil))
;; ミニバッファでC-hをバックスペースに割り当て
(define-key helm-map (kbd "C-h") 'delete-backward-char)
(define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)
;; TABで補完
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)

;; http://fukuyama.co/helm-swoop
(use-package helm-swoop)
;; Save buffer when helm-multi-swoop-edit complete
(setq helm-multi-swoop-edit-save t)
;; 値がtの場合はウィンドウ内に分割、nilなら別のウィンドウを使用
(setq helm-swoop-split-with-multiple-windows nil)
;; ウィンドウ分割方向 'split-window-vertically or 'split-window-horizontally
(setq helm-swoop-split-direction 'split-window-vertically)
;; nilなら一覧のテキストカラーを失う代わりに、起動スピードをほんの少し上げる
(setq helm-swoop-speed-or-color t)

(use-package helm-flycheck)

(use-package helm-gtags)
(add-hook 'php-mode-hook 'helm-gtags-mode)

(use-package helm-bind-key)

(helm-migemo-mode 1)

(helm-descbinds-install)

;;; 20-helm.el ends here
