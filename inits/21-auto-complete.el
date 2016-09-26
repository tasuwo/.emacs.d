;;; 21-auto-complete.el --- 補完

;;; Commentary:

;;; Code:

(use-package auto-complete
  :config
  (use-package auto-complete-config)

  (global-auto-complete-mode t)

  ;; 自動補完をon
  (setq ac-auto-start 0)

  ;; 自動でメニュー表示
  (setq ac-auto-show-menu t)

  ;; use C-n/C-p on the menu
  (setq ac-use-menu-map t)

  ;; fuzzy match
  (setq ac-use-fuzzy t)

  ;; tab で補完開始
  (ac-set-trigger-key "TAB")

  ;; デフォルトの補完ソース
  (setq-default ac-sources
                '(ac-source-filename
                  ac-source-abbrev
                  ac-source-words-in-same-mode-buffers
                  ac-source-semantic)))

;;; 21-auto-complete.el ends here

