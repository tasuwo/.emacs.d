
;;; Code:

;;;;;;;;;;;;;;;;;;;;;;
;; auto-complete
(require 'auto-complete)
(require 'auto-complete-config)
(global-auto-complete-mode t)
(ac-config-default)

(add-to-list 'ac-modes 'text-mode)
(add-to-list 'ac-modes 'fundamental-mode)
(add-to-list 'ac-modes 'org-mode)
(add-to-list 'ac-modes 'yatex-mode)
;; Start automatically completion when you typed one or more character
(setq ac-auto-start 3)
;; use C-n/C-p on the menu
(setq ac-use-menu-map t)
;; fuzzy match
(setq ac-use-fuzzy t)
(setq ac-dwim t)
;; Set source of information
(setq-default ac-sources
              '(ac-source-filename
                ac-source-yasnippet
                ac-source-abbrev
                ac-source-dictionary
                ac-source-words-in-same-mode-buffers))

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
    (requires . 3)))

;;; 20-auto-complete.el ends here
