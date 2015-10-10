
;;; Code:

;; カーソル位置のブラウザを開く
(defun browse-url-at-point ()
  (interactive)
  (let ((url-region (bounds-of-thing-at-point 'url)))
    (when url-region
      (browse-url (buffer-substring-no-properties (car url-region)
                                                  (cdr url-region))))))
(global-set-key "\C-c\C-o" 'browse-url-at-point)

;; スペースを除いた文頭へ移動
(define-key global-map "\M-a" 'back-to-indentation)

;; 後方削除
(define-key global-map "\C-h" 'delete-backward-char)

;; 選択範囲をコメントアウト
(global-set-key "\C-c\C-c" 'comment-region)

;; ヘルプ
(define-key global-map "\M-?" 'help-for-help)

;;;;;;;;;;;;
;; js-doc
; (define-key global-map "\C-ci" 'js-doc-insert-function-doc)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; multipule-cursors & smartrep
(require 'multiple-cursors)
(require 'smartrep)
(declare-function smartrep-define-key "smartrep")
(global-set-key (kbd "C-M-c") 'mc/edit-lines)
(global-set-key (kbd "C-M-r") 'mc/mark-all-in-region)
(global-unset-key "\C-t")
(smartrep-define-key global-map "C-t"
  '(("C-t"      . 'mc/mark-next-like-this)
    ("j"        . 'mc/mark-next-like-this)
    ("k"        . 'mc/mark-previous-like-this)
    ("u"        . 'mc/unmark-next-like-this)
    ("U"        . 'mc/unmark-previous-like-this)
    ("s"        . 'mc/skip-to-next-like-this)
    ("S"        . 'mc/skip-to-previous-like-this)
    ("*"        . 'mc/mark-all-like-this)))

;;;;;;;;
;; helm
(define-key global-map (kbd "M-x")     'helm-M-x)
(define-key global-map (kbd "C-x C-f") 'helm-find-files)
(define-key global-map (kbd "C-x C-r") 'helm-recentf)
;;;;;;;;;;;;;;;
;; helm-swoop
(global-set-key (kbd "M-i") 'helm-swoop)
(global-set-key (kbd "M-I") 'helm-swoop-back-to-last-point)
(global-set-key (kbd "C-c M-i") 'helm-multi-swoop)
(global-set-key (kbd "C-x M-i") 'helm-multi-swoop-all)
;; isearch実行中にhelm-swoopに移行
(define-key isearch-mode-map (kbd "M-i") 'helm-swoop-from-isearch)
;; helm-swoop実行中にhelm-multi-swoop-allに移行
(define-key helm-swoop-map (kbd "M-i") 'helm-multi-swoop-all-from-helm-swoop)
;;;;;;;;;;;;;;;;;;
;; helm-flycheck
(eval-after-load 'flycheck
  '(define-key flycheck-mode-map (kbd "C-c !") 'helm-flycheck))
;;;;;;;;;;;;;;;
;; helm-gtags
(add-hook 'helm-gtags-mode-hook
          '(lambda ()
             ;;入力されたタグの定義元へジャンプ
             (local-set-key (kbd "M-t") 'helm-gtags-find-tag)
             ;;入力タグを参照する場所へジャンプ
             (local-set-key (kbd "M-r") 'helm-gtags-find-rtag)
             ;;入力したシンボルを参照する場所へジャンプ
             (local-set-key (kbd "M-s") 'helm-gtags-find-symbol)
             ;;タグ一覧からタグを選択し, その定義元にジャンプする
             (local-set-key (kbd "M-l") 'helm-gtags-select)
             ;;ジャンプ前の場所に戻る
             (local-set-key (kbd "C-t") 'helm-gtags-pop-stack)))

;;;;;;;;;;;;
;; flycheck
(global-set-key (kbd "C-x !") 'flycheck-list-errors)
(smartrep-define-key
    global-map "M-g" '(("M-n" . 'flymake-goto-next-error)
                       ("M-p" . 'flymake-goto-prev-error)))

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
;; direx
(global-set-key (kbd "C-x C-j") 'direx:jump-to-directory-other-window)
(global-unset-key (kbd "C-x C-d"))
(global-set-key (kbd "C-x C-d") 'direx:jump-to-directory)

;;;;;;;;;;;;
;; コピー
(global-set-key (kbd "C-x w") 'kill-ring-save)

;;;;;;;;;;;;;;;;;;;;;
;; ファイルパスの取得
(global-set-key (kbd "C-c p") 'my/copy-current-path)

;;;;;;;;;;;;;;;;;;;
;; window-resizer
(global-set-key (kbd "C-c r") 'window-resizer)

;;;;;;;;;;;;;;;;;;;;;;;;;
;; 分割ウインドウ間の移動
(global-set-key (kbd "C-c m") 'window-move)

;;;;;;;;;;;;;
;; auto-complete
;; completion for english words
(global-set-key (kbd "M-h") 'ac-complete-look)
;; trigger key
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")

;;;;;;;;;;;;;;
;; yasnippet
;; 既存スニペットを挿入する
(define-key yas-minor-mode-map (kbd "C-x i i") 'yas-insert-snippet)
;; 新規スニペットを作成するバッファを用意する
(define-key yas-minor-mode-map (kbd "C-x i n") 'yas-new-snippet)
;; 既存スニペットを閲覧・編集する
(define-key yas-minor-mode-map (kbd "C-x i v") 'yas-visit-snippet-file)
;; Remove Yasnippet's default tab key binding
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)
;; Set Yasnippet's key binding to shift+tab
(define-key yas-minor-mode-map (kbd "<backtab>") 'yas-expand)
;; Alternatively use Control-c + tab
;; (define-key yas-minor-mode-map (kbd "\C-c TAB") 'yas-expand)

;;;;;;;;;;;;;;
;; git-gutter-+
(global-set-key (kbd "C-x g") 'git-gutter+-mode) ; Turn on/off in the current buffer
(global-set-key (kbd "C-x G") 'global-git-gutter+-mode) ; Turn on/off globally
(eval-after-load 'git-gutter+
  '(progn
     ;;; Jump between hunks
     (define-key git-gutter+-mode-map (kbd "C-x n") 'git-gutter+-next-hunk)
     (define-key git-gutter+-mode-map (kbd "C-x p") 'git-gutter+-previous-hunk)
     ;;; Act on hunks
     (define-key git-gutter+-mode-map (kbd "C-x v =") 'git-gutter+-show-hunk)
     (define-key git-gutter+-mode-map (kbd "C-x r") 'git-gutter+-revert-hunks)
     ;; Stage hunk at point.
     ;; If region is active, stage all hunk lines within the region.
     (define-key git-gutter+-mode-map (kbd "C-x t") 'git-gutter+-stage-hunks)
     (define-key git-gutter+-mode-map (kbd "C-x c") 'git-gutter+-commit)
     (define-key git-gutter+-mode-map (kbd "C-x C") 'git-gutter+-stage-and-commit)
     (define-key git-gutter+-mode-map (kbd "C-x C-y") 'git-gutter+-stage-and-commit-whole-buffer)
     (define-key git-gutter+-mode-map (kbd "C-x U") 'git-gutter+-unstage-whole-buffer)))

;;; 99-keybind.el ends here
