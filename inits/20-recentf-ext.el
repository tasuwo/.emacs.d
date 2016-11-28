;;; 20-recentf-ext.el --- 「最近使ったファイル」一覧を保存，参照する

;;; Commentary:

;;; Code:

(use-package recentf
  :config
  (defadvice recentf-cleanup (around no-message activate)
    "suppress the output from `message' to minibuffer"
    (cl-flet ((message (format-string &rest args) ()))))
  (setq recentf-save-file "~/.emacs.d/.recentf")
  (setq recentf-max-saved-items 100)             ;; recentf に保存するファイルの数
  (setq recentf-exclude '(".recentf"))           ;; .recentf自体は含まない
  (setq recentf-auto-cleanup 10)                 ;; 保存する内容を整理
  (run-with-idle-timer 300 t 'recentf-save-list) ;; 30秒ごとに .recentf を保存

  ;; recentf の以下の問題点を解消
  ;;  - find-file したファイルしか扱っていない
  ;;  - ディレクトリは扱ってくれいない
  (use-package recentf-ext))


;;; 20-recentf-ext.el ends here
