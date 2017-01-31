;; 30-edit-mode-javascript.el --- Edit mode for javascript

;;; Commentary:

;;; Code:

(use-package js2-mode
  :mode (("\.js$" . js2-mode))
  :init
  ;; JavaScript リファクタリング用ライブラリ
  (use-package js2-refactor
    :init
    (add-hook 'js2-mode-hook #'js2-refactor-mode)
    :config
    (js2r-add-keybindings-with-prefix "C-c C-j"))
  ;; js のためのコード解析エンジン
  ;; ~/.tern-project に設定を書くと良い
  (use-package tern
    :init
    (add-hook 'js2-mode-hook (lambda () (tern-mode t)))
    :config
    (setq ac-js2-evaluate-calls t)
    (setq js2-cleanup-whitespace nil  ;; 行末の空白を保存時に削除しない
          js2-mirror-mode nil         ;; 開きかっこ入力の際に閉じかっこを補完しない
          js2-bounce-indent-flag nil) ;; c-basic-offset でインデント幅を設定する
    )

    ;; 改行時の自動インデントをオフにする
    (define-key js2-mode-map "\C-m" nil)

    (use-package js2-imenu-extras)

    (setq js2-basic-offset 2))

;;; 30-edit-mode-javascript.el ends here
