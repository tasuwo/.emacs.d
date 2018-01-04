
;;; Commentary:

;; [emacsの補完用パッケージcompany-mode - Qiita](http://qiita.com/sune2/items/b73037f9e85962f5afb7)
;; [Best company-backends lists - Emacs Stack Exchange](http://emacs.stackexchange.com/questions/17537/best-company-backends-lists)

;;; Code:

(use-package company
  :init
  ;; Yasnippet の補完を常に有効にする
  ;; https://github.com/syl20bnr/spacemacs/pull/179
  ;; (defvar company-mode/enable-yas t
  ;;   "Enable yasnippet for all backends.")
  ;; (defun company-mode/backend-with-yas (backend)
  ;;   (if (or (not company-mode/enable-yas) (and (listp backend) (member 'company-yasnippet backend)))
  ;;       backend
  ;;     (append (if (consp backend) backend (list backend))
  ;;             '(:with company-yasnippet))))

  (add-hook 'after-change-major-mode-hook
            (lambda ()
              ;; メジャーモード切り替え時に，ヤスニペット補完のための backend 追加
              ;; (if (eq company-mode t)
              ;;     (setq company-backends (mapcar #'company-mode/backend-with-yas company-backends)))
            ))

  :config
  (setq company-idle-delay 0.1)
  (setq company-minimum-prefix-length 2) ; デフォルトは4
  (setq company-selection-wrap-around t) ; 候補の一番下でさらに下に行こうとすると一番上に戻る

  ;; C-n, C-pで補完候補を次/前の候補を選択
  (define-key company-active-map (kbd "C-n") 'company-select-next)
  (define-key company-active-map (kbd "C-p") 'company-select-previous)
  (define-key company-search-map (kbd "C-n") 'company-select-next)
  (define-key company-search-map (kbd "C-p") 'company-select-previous)

  (define-key company-active-map (kbd "\C-d") 'company-show-doc-buffer)
  (define-key company-active-map (kbd "M-.") 'company-show-location)

  ;; C-sで絞り込む
  (define-key company-active-map (kbd "C-s") 'company-filter-candidates)

  ;; TABで候補を設定
  (define-key company-active-map (kbd "C-i") 'company-complete-selection)

  ;; 各種メジャーモードでも C-M-iで company-modeの補完を使う
  (define-key emacs-lisp-mode-map (kbd "C-M-i") 'company-complete)

  ;; 色の設定
  (set-face-attribute 'company-tooltip nil
                      :foreground "black" :background "lightgrey")
  (set-face-attribute 'company-tooltip-common nil
                      :foreground "black" :background "lightgrey")
  (set-face-attribute 'company-tooltip-common-selection nil
                      :foreground "white" :background "steelblue")
  (set-face-attribute 'company-tooltip-selection nil
                      :foreground "black" :background "steelblue")
  (set-face-attribute 'company-preview-common nil
                      :background nil :foreground "lightgrey" :underline t)
  (set-face-attribute 'company-scrollbar-fg nil
                      :background "orange")
  (set-face-attribute 'company-scrollbar-bg nil
                      :background "gray40")

  ;; baddrev がいまいち仕事をしてくれなかったのでデフォルトを使用することにした
  ;; set default `company-backends'
  ;; https://emacs.stackexchange.com/questions/17537/best-company-backends-lists/17548
  ;; (setq company-backends
  ;;     '((company-files          ; files & directory
  ;;        company-keywords       ; keywords
  ;;        company-capf
  ;;        company-yasnippet
  ;;        )
  ;;       (company-abbrev company-dabbrev)
  ;;       ))

  ;; 補完結果のソート
  (setq company-transformers '(company-sort-by-backend-importance))
  ;; 多く選択したものを候補の上位にもってくる
  (require 'company-statistics)
  (company-statistics-mode)

  ;; タブ押下で company-completion 開始 ;;
  (define-key company-mode-map [remap indent-for-tab-command]
    'company-indent-for-tab-command)

  (setq tab-always-indent 'complete)

  (defvar completion-at-point-functions-saved nil)

  (defun company-indent-for-tab-command (&optional arg)
    (interactive "P")
    (let ((completion-at-point-functions-saved completion-at-point-functions)
          (completion-at-point-functions '(company-complete-common-wrapper)))
      (indent-for-tab-command arg)))

  (defun company-complete-common-wrapper ()
    (let ((completion-at-point-functions completion-at-point-functions-saved))
      (company-complete-common)))
  ;;                                     ;;
  )

;; Emacs lisp
(add-hook 'emacs-lisp-mode-hook
          (lambda()
            (company-mode t)
            (add-to-list (make-local-variable 'company-backends)
                         '(company-elisp :with company-dabbrev-code))))

;; Lisp(SLIME)
(add-hook 'slime-mode-hook
          (lambda ()
            (company-mode t)
            (setq company-idle-delay 0.1)
            (use-package company-slime)
            (add-to-list (make-local-variable 'company-backends)
                         '(company-slime :with company-dabbrev-code))))

;; Python
;; (require 'jedi-core)
;; (add-hook 'python-mode-hook 'jedi:setup)
;; (add-hook 'python-mode-hook
;;           (lambda ()
;;             (company-mode t)
;;             (setq jedi:complete-on-dot t)
;;             (setq jedi:use-shortcuts t)
;;             (add-to-list (make-local-variable 'company-backends)
;;                          '(company-jedi :with company-dabbrev-code))))

;; Swift
(use-package company-sourcekit
  :defer t
  :if (locate-library "company-sourcekit")
  :init
  (add-hook 'swift-mode-hook
            (lambda()
              (company-mode t)
              (setq sourcekit-verbose t
                    company-sourcekit-verbose t)
              (setq sourcekit-sourcekittendaemon-executable "/usr/local/bin/sourcekittendaemon")
              (add-to-list (make-local-variable 'company-backends)
                           '(company-sourcekit)))))


;; C, C++
(use-package company-c-headers
  :defer t
  :if (locate-library "company-c-headers")
  :init
  (add-hook 'c-mode-hook
            (lambda ()
              (company-mode t)
              (setq sourcekit-available-ports '(44876))
              (add-to-list (make-local-variable 'company-backends)
                           '(company-c-headers :with company-dabbrev-code))))
  (add-hook 'c++-mode-hook
            (lambda ()
              (company-mode t)
              (add-to-list (make-local-variable 'company-backends)
                           '(company-c-headers :with company-dabbrev-code)))))

;; C#
(add-hook 'csharp-mode-hook
          (lambda ()
            (add-to-list (make-local-variable 'company-backends)
                         'company-omnisharp)
            (company-mode t)
            ))

;; Web
(add-hook 'web-mode-hook
          (lambda ()
            (require 'company-web-html)
            (add-to-list (make-local-variable 'company-backends)
                         'company-web-html)
            (add-to-list (make-local-variable 'company-backends)
                         'company-css)
            (company-mode t)
            ))

;; php
(add-hook 'php-mode-hook
          (lambda ()
            (company-mode t)
            (require 'company-php)
            (add-to-list (make-local-variable 'company-backends)
                         '(company-ac-php-backend :with company-dabbrev-code))
            ))

;; JavaScript
(add-hook 'js2-mode-hook
          (lambda ()
            (company-mode t)
            (require 'tern)
            (tern-mode t)
            (require 'company-tern)
            (add-to-list (make-local-variable 'company-backends)
                         '(company-tern :with company-dabbrev-code))))
(add-hook 'js2-jsx-mode-hook
          (lambda ()
            (company-mode t)
            (require 'tern)
            (tern-mode t)
            (require 'company-tern)
            (add-to-list (make-local-variable 'company-backends)
                         '(company-tern :with company-dabbrev-code))))

;; Haskell
(add-hook 'haskell-mode-hook
          (lambda ()
            (company-mode t)
            (add-to-list (make-local-variable 'company-backends)
                         '(company-ghc :with company-dabbrev-code))
            ))

;; Scala
(add-hook 'scala-mode-hook
          (lambda ()
            (company-mode t)))

;; Ruby
(add-hook 'ruby-mode-hook
          (lambda ()
            (require 'robe)
            (robe-mode t)
            (company-mode t)
            (add-to-list (make-local-variable 'company-backends)
                         '(company-robe :with company-dabbrev-code))
            ))

;; PlantUML
(add-hook 'plantuml-mode-hook
          (lambda ()
            (company-mode t)))

;;; 22-company.el ends here
