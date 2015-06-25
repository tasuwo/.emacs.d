
;;; Code:

;;(electric-indent-mode 0)

;; 文字コード
(set-language-environment "Japanese")
(let ((ws window-system))
  (cond ((eq ws 'w32)
         (prefer-coding-system 'utf-8-unix)
         (set-default-coding-systems 'utf-8-unix)
         (setq file-name-coding-system 'sjis)
         (setq locale-coding-system 'utf-8))
        ((eq ws 'ns)
         (require 'ucs-normalize)
         (prefer-coding-system 'utf-8-hfs)
         (setq file-name-coding-system 'utf-8-hfs)
     (setq locale-coding-system 'utf-8-hfs))))
(prefer-coding-system 'utf-8-unix)

;; クリップボードを使用
(setq x-select-enable-clipboard t)

;; 行番号表示
(global-linum-mode t)
(set-face-attribute 'linum nil
            :foreground "#a9a9a9"
            :height 0.9)

;; 現在行のハイライト
(defface hlline-face
  '((((class color)
      (background dark))
     (:background "RoyalBlue4" t))
    (((class color)
      (background light))
     (:background  "ForestGreen" t))
    (t
     ()))
  "*Face used by hl-line.")
(setq hl-line-face 'hlline-face)
(global-hl-line-mode)


;; スタートアップを非表示
(setq inhibit-startup-screen t)

;; scratchの初期メッセージ消去
(setq initial-scratch-message "")

;; ツールバーを非表示
(tool-bar-mode -1)

;; メニューバーを非表示
(menu-bar-mode -1)

;; スクロールバーを非表示
(cond (windows-p
       nil)
      (darwin-p
       (set-scroll-bar-mode nil)))

;;; スクロールを一行ずつにする
(setq scroll-step 1)

;; 選択領域の色指定
(set-face-background 'region "#555")

;; 行末の空白を強調表示
;;(setq-default show-trailing-whitespace t)
;;(set-face-background 'trailing-whitespace "#b14770")

;; タブ幅
(custom-set-variables '(tab-width 4))

;; インデント整形時，タブの代わりにスペースを用いる
(setq-default indent-tabs-mode nil)

;; 余計な整形をしない
;;(setq-default cperl-indent-region-fix-constructs nil)
;;(setq-default cperl-merge-trailing-else nil)

;; モードラインに行番号表示
(line-number-mode t)

;; モードラインに列番号表示
(column-number-mode t)

;;; 現在の関数名をモードラインに表示
(which-function-mode 1)

;; Emacs の質問を y or n に
(fset 'yes-or-no-p 'y-or-n-p)

;; カーソル位置が何文字目か，何行目かを表示
(column-number-mode t)
(line-number-mode t)

;; 通常のウィンドウで行を折り返さない
(setq-default truncate-lines t)

;; 対応する括弧をハイライト
(setq show-paren-delay 0)
(show-paren-mode t)

;; バックアップを生成しない
(setq make-backup-files nil) ;; *.~
(setq auto-save-default nil) ;; .#*
(setq backup-inhibited t)

;; 補完時に大文字小文字を区別しない
(setq completion-ignore-case t)

;; ファイルが他で編集された場合，
;; 自動的に buffer を再読み込み
(global-auto-revert-mode 1)

;; 同名ファイルのバッファにおける識別文字列変更
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;;; 00-basic.el ends here
