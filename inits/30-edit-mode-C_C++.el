
;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; C/C++
;; http://futurismo.biz/archives/3071
(defun my-c-c++-mode-init ()
  (setq c-basic-offset 4)
)
(add-hook 'c-mode-hook 'my-c-c++-mode-init)
(add-hook 'c++-mode-hook 'my-c-c++-mode-init)

(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))

;; http://qiita.com/akisute3@github/items/6fb94c30f92dae2a24ee
;; http://futurismo.biz/archives/3071
(add-hook 'c-mode-common-hook 'flycheck-mode)
(defmacro flycheck-define-clike-checker (name command modes)
  `(flycheck-define-checker ,(intern (format "%s" name))
     ,(format "A %s checker using %s" name (car command))
     :command (,@command source-inplace)
     :error-patterns
     ((warning line-start (file-name) ":" line ":" column ": 警告:" (message) line-end)
      (error line-start (file-name) ":" line ":" column ": エラー:" (message) line-end))
     :modes ',modes))
(flycheck-define-clike-checker c-gcc-ja
             ("gcc" "-fsyntax-only" "-Wall" "-Wextra")
             c-mode)
(add-to-list 'flycheck-checkers 'c-gcc-ja)
(flycheck-define-clike-checker c++-g++-ja
             ("g++" "-fsyntax-only" "-Wall" "-Wextra" "-std=c++11")
             c++-mode)
(add-to-list 'flycheck-checkers 'c++-g++-ja)

;;; 30-edit-mode-C_C++.el ends here
