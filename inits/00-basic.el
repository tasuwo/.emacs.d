
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
(set-clipboard-coding-system 'utf-8)
(setq x-select-enable-clipboard t)

;; 行番号表示
(global-linum-mode t)
(set-face-attribute 'linum nil
            :foreground "#a9a9a9"
            :height 0.9)
(setq linum-format "%4d| ")

;; 現在行のハイライト
;; (defface hlline-face
;;   '((((class color)
;;       (background dark))
;;      (:background "gray18" t))
;;     (((class color)
;;       (background light))
;;      (:background  "ForestGreen" t))
;;     (t
;;      ()))
;;   "*Face used by hl-line.")
;; (setq hl-line-face 'hlline-face)
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

;; C-x C-f を便利にする
(ffap-bindings)

;; 現在開いているファイルのパスをクリップボードに保存
(defun my/get-curernt-path ()
  (if (equal major-mode 'dired-mode)
      default-directory
        (buffer-file-name)))
(defun my/copy-current-path ()
  (interactive)
  (let ((fPath (my/get-curernt-path)))
    (when fPath
      (message "stored path: %s" fPath)
      (kill-new (file-truename fPath)))))

;; クリップボードとkill-ringを共有する
;; http://blog.lathi.net/articles/2007/11/07/sharing-the-mac-clipboard-with-emacs
(cond (darwin-p
       (defun copy-from-osx ()
         (shell-command-to-string "pbpaste"))
       (defun paste-to-osx (text &optional push)
         (let ((process-connection-type nil))
           (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
             (process-send-string proc text)
             (process-send-eof proc))))
       (setq interprogram-cut-function 'paste-to-osx)
       (setq interprogram-paste-function 'copy-from-osx))
      (windows-p
       ;; その内な...
       ))


;; 分割ウインドウ間の移動
(windmove-default-keybindings)
(defun window-move ()
  "Moving between sepalated windows."
  (interactive)
  (let (action c)
    (catch 'end-flg
      (while t
        (setq action
              (read-key-sequence-vector (format "moving...")))
        (setq c (aref action 0))
        (cond ((= c ?l)
               (windmove-right))
              ((= c ?h)
               (windmove-left))
              ((= c ?k)
               (windmove-up))
              ((= c ?j)
               (windmove-down))
              ;; otherwise
              (t
               (let ((last-command-char (aref action 0))
                     (command (key-binding action)))
                 (when command
                   (call-interactively command)))
               (message "Quit.")
               (throw 'end-flag t)))))))

;; バッファ幅の変更
(defun window-resizer ()
  "Control window size and position."
  (interactive)
  (let ((window-obj (selected-window))
        (current-width (window-width))
        (current-height (window-height))
        (dx (if (= (nth 0 (window-edges)) 0) 1
              -1))
        (dy (if (= (nth 1 (window-edges)) 0) 1
              -1))
        action c)
    (catch 'end-flag
      (while t
        (setq action
              (read-key-sequence-vector (format "size[%dx%d]"
                                                (window-width)
                                                (window-height))))
        (setq c (aref action 0))
        (cond ((= c ?l)
               (enlarge-window-horizontally dx))
              ((= c ?h)
               (shrink-window-horizontally dx))
              ((= c ?j)
               (enlarge-window dy))
              ((= c ?k)
               (shrink-window dy))
              ;; otherwise
              (t
               (let ((last-command-char (aref action 0))
                     (command (key-binding action)))
                 (when command
                   (call-interactively command)))
               (message "Quit")
               (throw 'end-flag t)))))))

;; マウス操作設定
;; @see https://bitheap.org/mouseterm/
(xterm-mouse-mode t)
(mouse-wheel-mode t)
(global-set-key   [mouse-4] '(lambda () (interactive) (scroll-down 1)))
(global-set-key   [mouse-5] '(lambda () (interactive) (scroll-up   1)))
(unless window-system
  (xterm-mouse-mode 1)
  (global-set-key [mouse-4] '(lambda ()
                               (interactive)
                               (scroll-down 1)))
  (global-set-key [mouse-5] '(lambda ()
                               (interactive)
                               (scroll-up 1))))

;;; 00-basic.el ends here
