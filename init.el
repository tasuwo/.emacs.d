
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
(add-to-list 'load-path "~/.emacs.d/elisp/doxymacs")
(add-to-list 'load-path "~/.emacs.d/elisp/node-ac")
(add-to-list 'load-path "~/.emacs.d/elisp/yatex")
(setq auto-mode-alist
  (cons (cons "\.tex$" 'yatex-mode) auto-mode-alist))
(autoload 'yatex-mode "yatex" "Yet Another LaTeX mode" t)
(add-to-list 'load-path "/Applications/Emacs.app/Contents/Resources/site-lisp/yatex")
(setq tex-command "platex")
(setq dvi2-command "xdvi")

(setq tex-pdfview-command "xpdf")

(package-initialize)
(require 'use-package)
(require 'req-package)

;; Root Directory
(setq root-dir (file-name-directory
               (or (buffer-file-name) load-file-name)))

;; init-loader 設定
(use-package init-loader)
(setq init-loader-show-log-after-init 'error-only)
(init-loader-load "~/.emacs.d/inits")

(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/"))

;;; init.el ends here
