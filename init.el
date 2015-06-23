
;;; Code:

;; Cask 設定
;; homebrewで導入したtool用のpathを追加
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp")
(require 'cask "cask.el")
(cask-initialize)

;; init-loader 設定
(require 'init-loader)
(custom-set-variables
  '(init-loader-show-log-after-init 'error-only))
;;(setq init-loader-show-lod-after-init "error-only")
(init-loader-load "~/.emacs.d/inits")

;;; init.el ends here
