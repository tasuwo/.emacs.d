
;;; Code:
;; C-i でタブを入力できるように
(global-set-key "\C-i" '(lambda ()
                          (interactive)
                          (let ((width tab-width)
                                (str   ""))
                            (dotimes (i width)
                              (setq str (concat str " ")))
                            (insert str))))

;; カーソル位置のブラウザを開く
(defun browse-url-at-point ()
  (interactive)
  (let ((url-region (bounds-of-thing-at-point 'url)))
    (when url-region
      (browse-url (buffer-substring-no-properties (car url-region)
                                                  (cdr url-region))))))
(global-set-key "\C-c\C-o" 'browse-url-at-point)

;; 後方削除
(define-key global-map "\C-h" 'delete-backward-char)

;; 選択範囲をコメントアウト
(global-set-key "\C-c\C-c" 'comment-region)

;; ヘルプ
(define-key global-map "\M-?" 'help-for-help)

;;;;;;;;;;;;;
;; Anything
(define-key global-map (kbd "C-;") 'anything)

;;;;;;;;;;;;
;; js-doc
(define-key global-map "\C-ci" 'js-doc-insert-function-doc)

;;; 99-keybind.el ends here
