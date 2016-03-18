
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

;; load-path 追加
(add-to-list 'load-path "~/.emacs.d/elisp")

(package-initialize)
(require 'use-package)

;; Root Directory
(setq root-dir (file-name-directory
               (or (buffer-file-name) load-file-name)))

;; init-loader 設定
(use-package init-loader)
(custom-set-variables
;; custom-set-variables was added by Custom.
;; If you edit it by hand, you could mess it up, so be careful.
;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" default)))
 '(flycheck-display-errors-function (function flycheck-pos-tip-error-messages))
 '(helm-ff-auto-update-initial-value nil)
 '(init-loader-show-log-after-init (quote error-only))
 '(tab-width 4))
;;(setq init-loader-show-lod-after-init "error-only")
(init-loader-load "~/.emacs.d/inits")

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))

;;; init.el ends here
