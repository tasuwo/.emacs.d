
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

;;; init.el ends here
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(web-mode-comment-face ((t (:foreground "#D9333F"))))
 '(web-mode-css-at-rule-face ((t (:foreground "#FF7F00"))))
 '(web-mode-css-pseudo-class-face ((t (:foreground "#FF7F00"))))
 '(web-mode-css-rule-face ((t (:foreground "#A0D8EF"))))
 '(web-mode-doctype-face ((t (:foreground "#82AE46"))))
 '(web-mode-html-attr-name-face ((t (:foreground "#C97586"))))
 '(web-mode-html-attr-value-face ((t (:foreground "#82AE46"))))
 '(web-mode-html-tag-face ((t (:foreground "#E6B422" :weight bold))))
 '(web-mode-server-comment-face ((t (:foreground "#D9333F")))))
