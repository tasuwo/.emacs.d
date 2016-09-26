;;; 20-quickrun.el --- ソースコードの実行

;;; Commentary:

;;; Code:

(use-package quickrun
  :config
  ;; coffee script の実行のためのコマンド追加
  (quickrun-add-command "coffee-compile"
                        '((:command . "coffee")
                          (:exec . "%c --compile --print %s")
                          (:outputter . (lambda () (javascript-generic-mode))))
                        :default "coffee"))

;;; 20-quickrun.el ends here
