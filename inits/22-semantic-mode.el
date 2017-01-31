;;; 22-semantinc-mode.el --- 静的解析を利用した補完パッケージ

;;; Commentary:

;; Semantic は，ソースコードパーサを利用して構文を考慮した補完を行ってくれるパッケージ．
;; ソースコードをパースし，データベースを作成(SemanticDB) する．
;; 作成したデータベースは，補完の他にも，コードナビゲーションや定義元，参照元ジャンプ等に活用できる．
;;

;;; Code:

(use-package cc-mode)

(use-package semantic
  :config
  (global-semanticdb-minor-mode 1)
  (global-semantic-idle-scheduler-mode 1)
  (semantic-mode 1))

;; Semantic Refactor
;; Semanticパーサフレームワークに基づいたC/C++のリファクタリングツール
(use-package srefactor
  :init
  (use-package srefactor-lisp)
  :config
  (define-key c-mode-map (kbd "M-RET") 'srefactor-refactor-at-point)
  (define-key c++-mode-map (kbd "M-RET") 'srefactor-refactor-at-point)
  (global-set-key (kbd "M-RET o") 'srefactor-lisp-one-line)
  (global-set-key (kbd "M-RET m") 'srefactor-lisp-format-sexp)
  (global-set-key (kbd "M-RET d") 'srefactor-lisp-format-defun)
  (global-set-key (kbd "M-RET b") 'srefactor-lisp-format-buffer))

;;; 22-semantic-mode.el ends here
