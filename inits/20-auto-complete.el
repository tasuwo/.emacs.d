
;;; Code:

;;;;;;;;;;;;;;;;;;;;;;
;; auto-complete
(use-package auto-complete)
(use-package auto-complete-config)
(global-auto-complete-mode t)
(ac-config-default)

;; 適用するメジャーモード
(add-to-list 'ac-modes 'text-mode)
(add-to-list 'ac-modes 'fundamental-mode)
(add-to-list 'ac-modes 'org-mode)
(add-to-list 'ac-modes 'yatex-mode)
(add-to-list 'ac-modes 'web-mode)
(add-to-list 'ac-modes 'swift-mode)

;; 自動補完をoff
(setq ac-auto-start nil)

;; 補完のソース
(setq-default ac-sources
              '(ac-source-filename
                ac-source-yasnippet
                ac-source-abbrev
                ac-source-dictionary
                ac-source-words-in-same-mode-buffers))
(defun ac-web-mode-setup ()
  (setq-default ac-sources my-ac-sources))
(add-hook 'web-mode-hook 'ac-web-mode-setup)

;; use C-n/C-p on the menu
(setq ac-use-menu-map t)

;; fuzzy match
(setq ac-use-fuzzy t)
(setq ac-dwim t)

;; completion for english wards
(defun my-ac-look ()
  "look コマンドの出力をリストで返す"
  (interactive)
  (unless (executable-find "look")
    (error "look コマンドがありません"))
  (let ((search-word (thing-at-point 'word)))
    (with-temp-buffer
      (call-process-shell-command "look" nil t 0 search-word)
      (split-string-and-unquote (buffer-string) "\n"))))
(defun ac-complete-look ()
  (interactive)
  (let ((ac-menu-height 50)
        (ac-candidate-limit t))
  (auto-complete '(ac-source-look))))
(defvar ac-source-look
  '((candidates . my-ac-look)
    (use-packages. 3)))

;;; 20-auto-complete.el ends here
