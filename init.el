
;;; Code:


;; 環境判断用の変数
(defun x->bool (elt) (not (not elt)))
;; system-type predicates
(setq darwin-p  (eq system-type 'darwin)        ; Mac の場合
      linux-p   (eq system-type 'gnu/linux)     ; Linux の場合
      cygwin-p  (eq system-type 'cygwin)
      nt-p      (eq system-type 'windows-nt)
      meadow-p  (featurep 'meadow)
      windows-p (or cygwin-p nt-p meadow-p))    ; Windows の場合


;; Cask 設定
;; Mac : homebrewで導入したtool用のpathを追加 (for OS X)
;; Win : ホームディレクトリ直下の cask にパスを通す
(cond (darwin-p
       (add-to-list 'load-path "/usr/local/share/emacs/site-lisp")
       (require 'cask "cask.el"))
      (windows-p
       (add-to-list 'load-path "~/.cask")
       (require 'cask)))
;; 初期化
(cask-initialize)


;; Root Directory
(setq root-dir (file-name-directory
               (or (buffer-file-name) load-file-name)))


;; init-loader 設定
(require 'init-loader)
(custom-set-variables
  '(init-loader-show-log-after-init 'error-only))
;;(setq init-loader-show-lod-after-init "error-only")
(init-loader-load "~/.emacs.d/inits")

;;; init.el ends here
