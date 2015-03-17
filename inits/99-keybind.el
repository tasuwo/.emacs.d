
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

;; ヘルプ
(define-key global-map "\M-?" 'help-for-help)

;;; 99-keybind.el ends here
