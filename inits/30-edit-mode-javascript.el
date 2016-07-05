;;; 30-edit-mode-javascript.el --- Edit mode for javascript

;;; Commentary:

;;; Code:

(use-package js2-mode
  :mode (("\.js$" . js2-mode))
  :config
  (add-hook 'js2-mode-hook
            (lambda ()
              (setq js2-cleanup-whitespace nil  ;; 行末の空白を保存時に削除しない
                    js2-mirror-mode nil         ;; 開きかっこ入力の際に閉じかっこを補完しない
                    js2-bounce-indent-flag nil) ;; c-basic-offset でインデント幅を設定する
              ;; 改行時の自動インデントをオフにする
              (define-key js2-mode-map "\C-m" nil)
              ;; (use-package js2-imenu-extras)
              (setq js2-basic-offset 2))))

;; ;; JavaScript リファクタリング用ライブラリ
;; (use-package js2-refactor
;;   :requires js2-mode
;;   :commands js2-mode
;;   :config
;;   (add-hook 'js2-mode-hook #'js2-refactor-mode)
;;   (js2r-add-keybindings-with-prefix "C-c C-j"))

;; (use-package tern
;;   :commands js2-mode)
;; (use-package tern-auto-complete
;;   :requires tern
;;   :requires js2-mode
;;   :config
;;   (tern-mode t)
;;   (tern-ac-setup))

;;; 30-edit-mode-javascript.el ends here
