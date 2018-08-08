;;; 99-keybind.el --- Keybind settings

;;; Commentary:

;;; Code:


(use-package bind-key)

;; カーソル位置のブラウザを開く
(bind-key "C-c C-o" 'browse-url-at-point)
;; スペースを除いた文頭へ移動
(bind-key "M-a" 'back-to-indentation)
;; 後方削除
(bind-key "C-h" 'delete-backward-char)
;; 選択範囲をコメントアウト
(bind-key "C-c C-c" 'comment-region)
;; ヘルプ
(bind-key "M-?" 'help-for-help)
;; shell-command
(bind-key "M-!" nil)
(bind-key "M-s" 'shell-command)

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
             (local-set-key (kbd "C-j") 'helm-gtags-select)
             (local-set-key (kbd "M-.") 'helm-gtags-dwim)
             ;;ジャンプ前の場所に戻る
             (local-set-key (kbd "M-,") 'helm-gtags-pop-stack)
             (local-set-key (kbd "C-c <") 'helm-gtags-previous-history)
             (local-set-key (kbd "C-c >") 'helm-gtags-next-history)))

;;;;;;;;;;;;
;; flycheck
(bind-key "C-x !" 'flycheck-list-errors)

;;;;;;;;;;;;
;; expand region
(global-unset-key "\C-l")
(use-package expand-region
  :bind (("C-l" . er/expand-region)
         ("C-M-;" . er/contract-region))
  :config
  (transient-mark-mode t))

;;;;;;;;;;;;
;; smart-newline
(use-package smart-newline
  :bind (("C-m" . smart-newline))
  :config
  (smart-newline-mode 1))

;;;;;;;;;;;;
;; direx
(bind-key "C-x C-j" 'direx:jump-to-project-directory)
(add-hook 'direx:direx-mode-hook
          '(lambda ()
             (local-set-key (kbd "j") 'direx:next-item)
             (local-set-key (kbd "k") 'direx:previous-item)
             (local-set-key (kbd "h") 'direx:up-item)
             (local-set-key (kbd "l") 'direx:down-item)
             ))
;;(global-unset-key (kbd "C-x C-d"))
;;(bind-key "C-x C-d" 'direx:jump-to-directory)

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
;;(bind-key "C-x g" 'git-gutter+-mode) ; Turn on/off in the current buffer
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

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; zencoding
(bind-key "C-j" 'emmet-expand-line emmet-mode-keymap)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; magit
;; (bind-key (kbd "<f11>") 'magit-status)
(add-hook 'magit-mode-hook
          '(lambda ()
             (local-set-key (kbd "<f11>") 'magit-remote-rename)
             ))

(defun get-displayed-buffer-name-list ()
  ""
  (interactive)
  (catch 'displayed-buffer-name-list
   (let ((base-buffer (window-buffer))
         (buffer-name-list nil))
     (if (eq base-buffer nil)
         (message "no buffer")
       (let ((target-window (next-window (car (get-buffer-window-list)))))
         (add-to-list 'buffer-name-list (buffer-name base-buffer))
         (while (not (eq base-buffer (window-buffer target-window)))
           (add-to-list 'buffer-name-list
                        (buffer-name (window-buffer target-window)))
           (setq target-window (next-window target-window)))
         (throw 'displayed-buffer-name-list buffer-name-list))))))

(defun get-displayed-buffer-match-pattern (buffer-name-pattern)
  ""
  (interactive)
  (catch 'buffer
    (let ((buffer-name-list (get-displayed-buffer-name-list))
          (buffer nil))
      (dolist (buffer-name buffer-name-list)
        (if (string-match buffer-name-pattern buffer-name)
            (throw 'buffer (get-buffer buffer-name))))
      (throw 'buffer nil))))

(defun toggle-magit-status ()
  ""
  (interactive)
  (let ((buffer (get-displayed-buffer-match-pattern "*magit: \\(.*\\)")))
    (if buffer
        (delete-window (car (get-buffer-window-list buffer)))
      (magit-status))))

(bind-key "<f10>" 'toggle-magit-status)


;;;;;;;;;;;;;;
;; shell-pop
(bind-key "<f12>" 'shell-pop)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; multipule-cursors & smartrep
;; (global-unset-key "\C-t")
;; (use-package multiple-cursors
;;   :config
;;   (smartrep-define-key global-map "C-t"
;;    '(("C-t"      . 'mc/mark-next-like-this)
;;      ("j"        . 'mc/mark-next-like-this)
;;      ("k"        . 'mc/mark-previous-like-this)
;;      ("u"        . 'mc/unmark-next-like-this)
;;      ("U"        . 'mc/unmark-previous-like-this)
;;      ("s"        . 'mc/skip-to-next-like-this)
;;      ("S"        . 'mc/skip-to-previous-like-this)
;;      ("*"        . 'mc/mark-all-like-this)))
;;   (smartrep-define-key
;;    global-map "M-g" '(("M-n" . 'flymake-goto-next-error)
;;                       ("M-p" . 'flymake-goto-prev-error))))
;; (use-package smartrep)
;; (declare-function smartrep-define-key "smartrep")
;; (bind-key (kbd "C-M-c") 'mc/edit-lines)
;; (bind-key (kbd "C-M-r") 'mc/mark-all-in-region)
;; (global-unset-key "\C-t")

;;;;;;;;;;;;;;
;; evil-mode
(define-key evil-normal-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-visual-state-map (kbd "C-u") 'evil-scroll-up)
(define-key evil-insert-state-map (kbd "C-j") 'evil-normal-state)
(define-key evil-insert-state-map (kbd "C-j") 'evil-normal-state)
(define-key evil-insert-state-map (kbd "C-t") nil)
(define-key evil-normal-state-map (kbd "C-t") nil)
(use-package evil-mc
  :bind (("C-n" . evil-mc-make-and-goto-next-match)
         ("C-p" . evil-mc-make-and-goto-prev-match)
         ("C-*" . evil-mc-make-all-cursors)))
;;Exit insert mode by pressing j and then j quickly
(setq key-chord-two-keys-delay 1.0)
(key-chord-define evil-insert-state-map "jj" 'evil-normal-state)
(key-chord-mode 1)

;;;;;;;;;;;;;
;; TAGS
;; .el.gz に働かないので
(bind-key "<f9>" 'find-tag)
(bind-key "<f8>" 'pop-tag-mark)



;;; 99-keybind.el ends here
