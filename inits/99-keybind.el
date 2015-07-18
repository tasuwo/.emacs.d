
;;; Code:
;; C-i でタブを入力できるように
;; (global-set-key "\C-i" '(lambda ()
;;                           (interactive)
;;                           (let ((width tab-width)
;;                                 (str   ""))
;;                             (dotimes (i width)
;;                               (setq str (concat str " ")))
;;                             (insert str))))

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

;;;;;;;;;;;;
;; js-doc
; (define-key global-map "\C-ci" 'js-doc-insert-function-doc)

;;;;;;;;;;;;
;; multipule-cursors & smartrep
(require 'multiple-cursors)
(require 'smartrep)
(declare-function smartrep-define-key "smartrep")
(global-set-key (kbd "C-M-c") 'mc/edit-lines)
(global-set-key (kbd "C-M-r") 'mc/mark-all-in-region)
(global-unset-key "\C-t")
(smartrep-define-key global-map "\C-t"
  '(("C-t"      . 'mc/mark-next-like-this)
    ("n"        . 'mc/mark-next-like-this)
    ("p"        . 'mc/mark-previous-like-this)
    ("m"        . 'mc/mark-more-like-this-extended)
    ("u"        . 'mc/unmark-next-like-this)
    ("C-u"      . 'mc/unmark-previous-like-this)
    ("s"        . 'mc/skip-to-next-like-this)
    ("C-s"      . 'mc/skip-to-previous-like-this)
    ("*"        . 'mc/mark-all-like-this)
    ("d"        . 'mc/mark-all-like-this-dwim)
    ("i"        . 'mc/insert-numbers)
    ("o"        . 'mc/sort-regions)
    ("O"        . 'm)))

;;;;;;;;;;;;
;; expand region
(require 'expand-region)
(global-unset-key "\C-l")
(global-set-key (kbd "C-l") 'er/expand-region)
(global-set-key (kbd "C-M-l") 'er/contract-region) ;; リージョンを狭める
(transient-mark-mode t)

;;;;;;;;;;;;
;; smart-newline
(define-key global-map (kbd "C-m") 'smart-newline)

;;;;;;;;;;;;
;; デフォルトから変える
;; コピーのキーバインドを変える
(global-set-key (kbd "C-x w") 'kill-ring-save)

;; ファイルパスの取得
(global-set-key (kbd "C-c p") 'my/copy-current-path)

;; バッファ幅の変更
;; h,j,k,l で左右上下に動かせる
(global-set-key (kbd "C-c r") 'window-resizer)

;; 分割ウインドウ間の移動
(global-set-key (kbd "C-c m") 'window-move)

;;; 99-keybind.el ends here
