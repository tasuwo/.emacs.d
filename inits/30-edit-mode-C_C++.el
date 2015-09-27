
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

;;共通設定(?)
(setq-default c-basic-offset 4     ;;基本インデント量4
              tab-width 4          ;;タブ幅4
              indent-tabs-mode nil)  ;;インデントをタブでするかスペースでするか

;; C++ style
(defun add-c++-mode-conf ()
  (c-set-style "stroustrup")  ;;スタイルはストラウストラップ
  (show-paren-mode t))        ;;カッコを強調表示する
(add-hook 'c++-mode-hook 'add-c++-mode-conf)

;; C style
(defun add-c-mode-common-conf ()
  (c-set-style "stroustrup")                  ;;スタイルはストラウストラップ
  (show-paren-mode t)                         ;;カッコを強調表示する
  )
(add-hook 'c-mode-common-hook 'add-c-mode-common-conf)

;; ヘッダーの補完
;;(require 'auto-complete-c-headers)
;;(add-hook 'c++-mode-hook '(setq ac-sources (append ac-sources '(ac-source-c-headers))))
;;(add-hook 'c-mode-hook '(setq ac-sources (append ac-sources '(ac-source-c-headers))))

;;;;;;;;;;;;;;;;;;;;;;;
;; auto-complete-clang
;; http://boronology.blogspot.jp/2012/01/auto-complete-clangemacsc.html
;; http://ochiailab.blogspot.jp/2015/02/auto-complete-clang.html
(require 'auto-complete)
(require 'auto-complete-config)
(require 'auto-complete-clang)
(defun my-ac-cc-mode-setup ()
  ;;(setq ac-clang-prefix-header
  ;;"~/Documents/_Include/heddaa.pch")
  (setq ac-clang-flags '("-w" "-ferror-limit" "1"))
  (setq ac-sources (append '(ac-source-clang
        ac-source-yasnippet)
      ac-sources)))
(defun my-ac-config ()
  (define-key ac-complete-mode-map "\C-n" 'ac-next)
  (define-key ac-complete-mode-map "\C-p" 'ac-previous)
  (add-hook 'c-mode-common-hook 'my-ac-cc-mode-setup)
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (global-auto-complete-mode t))
(my-ac-config)
;; https://github.com/Sarcasm/irony-mode/issues/119
(eval-after-load 'company
  '(add-to-list 'company-backends 'company-irony))

;;; 30-edit-mode-C_C++.el ends here
