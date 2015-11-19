
;;; Code:

(require 'bind-key)

;; カーソル位置のブラウザを開く
(defun browse-url-at-point ()
  (interactive)
  (let ((url-region (bounds-of-thing-at-point 'url)))
    (when url-region
      (browse-url (buffer-substring-no-properties (car url-region)
                                                  (cdr url-region))))))
(bind-key "C-c C-o" 'browse-url-at-point)
;; スペースを除いた文頭へ移動
(bind-key "M-a" 'back-to-indentation global-map)
;; 後方削除
(bind-key "C-h" 'delete-backward-char global-map)
;; 選択範囲をコメントアウト
(bind-key "C-c C-c" 'comment-region)
;; ヘルプ
(bind-key "M-?" 'help-for-help)
;;;;;;;;;;;;
;; js-doc
(bind-key "C-c C-j" 'js-doc-insert-function-doc)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; multipule-cursors & smartrep
(require 'multiple-cursors)
(require 'smartrep)
(declare-function smartrep-define-key "smartrep")
(bind-key (kbd "C-M-c") 'mc/edit-lines)
(bind-key (kbd "C-M-r") 'mc/mark-all-in-region)
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
(bind-key "M-x"     'helm-M-x)
(bind-key "C-x C-f" 'helm-find-files)
(bind-key "C-x C-r" 'helm-recentf)
;;;;;;;;;;;;;;;
;; helm-swoop
(bind-key "M-i" 'helm-swoop)
(bind-key "M-I" 'helm-swoop-back-to-last-point)
(bind-key "C-c M-i" 'helm-multi-swoop)
(bind-key "C-x M-i" 'helm-multi-swoop-all)
;; isearch実行中にhelm-swoopに移行
(bind-key "M-i" 'helm-swoop-from-isearch isearch-mode-map)
;; helm-swoop実行中にhelm-multi-swoop-allに移行
(bind-key "M-i" 'helm-multi-swoop-all-from-helm-swoop helm-swoop-map)
;;;;;;;;;;;;;;;;;;
;; helm-flycheck
(eval-after-load 'flycheck
  '(bind-key "C-c !" 'helm-flycheck flycheck-mode-map))
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
(bind-key "C-x !" 'flycheck-list-errors)
(smartrep-define-key
    global-map "M-g" '(("M-n" . 'flymake-goto-next-error)
                       ("M-p" . 'flymake-goto-prev-error)))
;;;;;;;;;;;;
;; expand region
(require 'expand-region)
(global-unset-key "\C-l")
(bind-key "C-l" 'er/expand-region)
(bind-key "C-M-l" 'er/contract-region) ;; リージョンを狭める
(transient-mark-mode t)
;;;;;;;;;;;;
;; smart-newline
(bind-key "C-m" 'smart-newline)
;;;;;;;;;;;;
;; direx
(bind-key "C-x C-j" 'direx:jump-to-directory-other-window)
(global-unset-key (kbd "C-x C-d"))
(bind-key "C-x C-d" 'direx:jump-to-directory)
;;;;;;;;;;;;
;; コピー
(bind-key "C-x w" 'kill-ring-save)
;;;;;;;;;;;;;;;;;;;;;
;; ファイルパスの取得
(bind-key "C-c p" 'my/copy-current-path)
;;;;;;;;;;;;;;;;;;;
;; window-resizer
(bind-key "C-c r" 'window-resizer)
;;;;;;;;;;;;;;;;;;;;;;;;;
;; 分割ウインドウ間の移動
(bind-key "C-c m" 'window-move)
;;;;;;;;;;;;;
;; auto-complete
;; completion for english words
(bind-key "M-h" 'ac-complete-look)
;; trigger key
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")
;;;;;;;;;;;;;;
;; yasnippet
;; 既存スニペットを挿入する
(bind-key "C-x i i" 'yas-insert-snippet yas-minor-mode-map)
;; 新規スニペットを作成するバッファを用意する
(bind-key "C-x i n" 'yas-new-snippet yas-minor-mode-map)
;; 既存スニペットを閲覧・編集する
(bind-key "C-x i v" 'yas-visit-snippet-file yas-minor-mode-map)
;; Remove Yasnippet's default tab key binding
(bind-key "<tab>" nil yas-minor-mode-map)
(bind-key "TAB" nil yas-minor-mode-map)
;; Set Yasnippet's key binding to shift+tab
(bind-key "<backtab>" 'yas-expand yas-minor-mode-map)
;; Alternatively use Control-c + tab
;; (define-key yas-minor-mode-map (kbd "\C-c TAB") 'yas-expand)
;;;;;;;;;;;;;;
;; git-gutter-+
(bind-key "C-x g" 'git-gutter+-mode) ; Turn on/off in the current buffer
(bind-key "C-x G" 'global-git-gutter+-mode) ; Turn on/off globally
(eval-after-load 'git-gutter+
  '(progn
     ;;; Jump between hunks
     (bind-key "C-x n" 'git-gutter+-next-hunk git-gutter+-mode-map)
     (bind-key "C-x p" 'git-gutter+-previous-hunk git-gutter+-mode-map)
     ;;; Act on hunks
     (bind-key "C-x v =" 'git-gutter+-show-hunk git-gutter+-mode-map)
     (bind-key "C-x r" 'git-gutter+-revert-hunks git-gutter+-mode-map)
     ;; Stage hunk at point.
     ;; If region is active, stage all hunk lines within the region.
     (bind-key "C-x t" 'git-gutter+-stage-hunks git-gutter+-mode-map)
     (bind-key "C-x c" 'git-gutter+-commit git-gutter+-mode-map)
     (bind-key "C-x C" 'git-gutter+-stage-and-commit git-gutter+-mode-map)
     (bind-key "C-x C-y" 'git-gutter+-stage-and-commit-whole-buffer git-gutter+-mode-map)
     (bind-key "C-x U" 'git-gutter+-unstage-whole-buffer git-gutter+-mode-map)))

;; C-x h : describetable
;; f1 : description
;; f2 : jump to definition

;;; 99-keybind.el ends here
