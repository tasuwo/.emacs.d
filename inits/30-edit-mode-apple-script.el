
;;; Code:

;; http://d.hatena.ne.jp/sandai/20120613/p2
(use-package apples-mode)
(autoload 'apples-mode "apples-mode" "Happy AppleScripting!" t)
(autoload 'apples-open-scratch "apples-mode" "Open scratch buffer for AppleScript." t)
(add-to-list 'auto-mode-alist '("\\.\\(applescri\\|sc\\)pt\\'" . apples-mode))
(add-to-list 'auto-mode-alist '("\\.applescript\\'" . apples-mode))
;; scptファイルを開くと自動でデコンパイル
(add-hook 'find-file-hook
          '(lambda ()
            (when (and (string-match "\\.scpt$" (buffer-file-name))
                       (> (length  (buffer-string)) 0))
              (apples-decompile (buffer-file-name)))))
;; デコンパイル終了後の確認を無効
(setq apples-decompile-query '?o)
;; scptファイルを保存すると自動でコンパイルした内容を保存
(add-hook 'before-save-hook
          '(lambda ()
            (when (and (string-match "\\.scpt$" (buffer-file-name))
                       (> (length  (buffer-string)) 0))
              (apples-compile (buffer-file-name)))))

;;; 30-edit-mode-apple-script.el
