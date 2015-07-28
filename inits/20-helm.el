
;;; Code:

(require 'helm-config)
(helm-mode 1)

;; 自動補完を無効
(custom-set-variables '(helm-ff-auto-update-initial-value nil))
;; ミニバッファでC-hをバックスペースに割り当て
(define-key helm-map (kbd "C-h") 'delete-backward-char)
(define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)
;; TABで補完
(define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
(define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)

;;; 30-helm.el ends here
