;;; 30-edit-mode-apple-script.el --- Edit mode for apple script

;;; Commentary:

;;; Code:
;; http://d.hatena.ne.jp/sandai/20120613/p2

(use-package apples-mode
  :mode (("\\.\\(applescri\\|sc\\)pt\\'" . apples-mode)
         ("\\.applescript\\'" . apples-mode))
  :config
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
                 (apples-compile (buffer-file-name))))))

;;; 30-edit-mode-apple-script.el ends here
