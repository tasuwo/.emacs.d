;;; 20-pallet.el --- Emacs のためのパッケージマネジメントヘルパー

;;; Commentary:

;; Cask の機能を用いたパッケージ管理ツール
;; M-x package-install の結果を自動的に Cask ファイルに反映してくれる

;;; Code:
(use-package pallet
  :config
  (pallet-mode t))

;;; 20-pallet.el ends here
