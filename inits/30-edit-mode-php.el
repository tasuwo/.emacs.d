;;; Code:

(use-package php-mode)

;; 起動時に設定をロードする
(autoload 'php-mode "php-mode" nil t)

;; 適用ファイル
(setq auto-mode-alist (cons '("\\.php$" . php-mode) auto-mode-alist))

;; タブ幅等設定
(add-hook 'php-mode-hook
          '(lambda()
             (use-package php-completion)
             (setq tab-width 4)
             (setq indent-tabs-mode false)
             (setq c-basic-offset 4)
             (flymake-mode t)
             (setq php-mode-force-pear t)
             (use-package php-completion)
             (php-completion-mode t)
             (make-local-variable 'ac-sources)
             (add-to-list 'ac-sources 'ac-source-php-completion)
             (add-to-list 'ac-sources 'ac-source-filename)))

;;; 30-edit-mode-php.el ends here
