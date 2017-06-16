;;; 30-edit-mode-php.el --- Major mode for php

;;; Commentary:

;;; Code:

(use-package ruby-mode
  :mode (("\\.rb$\\'" . ruby-mode))
  :init
  (add-hook 'ruby-mode-hook
            '(lambda()
               ;; http://qiita.com/hiconyan/items/582e27128decfe9d249e
               (defadvice ruby-indent-line (after unindent-closing-paren activate)
                 (let ((column (current-column))
                       indent offset)
                   (save-excursion
                     ;; ポイント(カーソル)をインデントの位置に移動する
                     (back-to-indentation)
                     ;; syntax-ppssはparserの状態を表すリストを返す
                     ;; 1番目の要素は括弧の深さ、2番目の要素は一番内側の開始括弧の位置を表す
                     (let ((state (syntax-ppss)))
                       ;; ポイントの初期状態とインデントの位置との差をoffsetとする
                       (setq offset (- column (current-column)))
                       ;; ポイントの位置の文字が')'で括弧の中にある場合
                       (when (and (eq (char-after) ?\))
                                  (not (zerop (car state))))
                         ;; 一番内側の'('に移動
                         (goto-char (cadr state))
                         ;; インデント幅を取得
                         (setq indent (current-indentation)))))
                   (when indent
                     ;; インデントする
                     (indent-line-to indent)
                     ;; オフセットが存在する場合、その分だけポイントを移動する
                     ;; つまり、インデント修正後のポイントのあるべき場所に戻る
                     (when (> offset 0) (forward-char offset)))))
               )))

(use-package rspec-mode
  :mode (("\\.rb$\\'" . ruby-mode)))
