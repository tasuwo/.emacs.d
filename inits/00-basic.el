
;;; Code:

;; 文字コード
(set-language-environment "Japanese")
(let ((ws window-system))
  (cond ((eq ws 'w32)
         (prefer-coding-system 'utf-8-unix)
         (set-default-coding-systems 'utf-8-unix)
         (setq file-name-coding-system 'sjis)
         (setq locale-coding-system 'utf-8))
        ((eq ws 'ns)
         (use-package ucs-normalize)
         (prefer-coding-system 'utf-8-hfs)
         (setq file-name-coding-system 'utf-8-hfs)
     (setq locale-coding-system 'utf-8-hfs))))
(prefer-coding-system 'utf-8-unix)

;; 行番号表示
(global-linum-mode t)
(set-face-attribute 'linum nil
            :foreground "#a9a9a9"
            :height 0.9)
(setq linum-format "%4d| ")

;; 現在行のハイライト
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
(set-face-background 'region "#800000")

;; 行末の空白を強調表示
(setq-default show-trailing-whitespace t)
(set-face-background 'trailing-whitespace "#b14770")

;; タブ幅
(custom-set-variables '(tab-width 4))

;; インデント整形時，タブの代わりにスペースを用いる
(setq-default indent-tabs-mode nil)

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

;; Emacs の質問を y or n に
(fset 'yes-or-no-p 'y-or-n-p)

;; ファイルが他で編集された場合自動的に buffer を再読み込み
(global-auto-revert-mode 1)

;; 同名ファイルのバッファにおける識別文字列変更
(use-package uniquify)
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

(setq mouse-wheel-scroll-amount '(1 ((shift) . 1))) ;; one line at a time
(setq mouse-wheel-progressive-speed nil) ;; don't accelerate scrolling
(setq mouse-wheel-follow-mouse 't) ;; scroll window under mouse

;; color theme
;; http://emacsthemes.caisah.info/
;;(use-package darcula-theme)
;; http://aoe-tk.hatenablog.com/entry/20130210/1360506829
;; (load-theme 'misterioso t)
(load-theme 'wombat t)

;; 余計な整形をしない
;;(setq-default cperl-indent-region-fix-constructs nil)
;;(setq-default cperl-merge-trailing-else nil)

;; モードラインに行番号表示
;;(line-number-mode t)

;; モードラインに列番号表示
;;(column-number-mode t)

;;; 現在の関数名をモードラインに表示
;;(which-function-mode 1)

;; カーソル位置が何文字目か，何行目かを表示
;;(column-number-mode t)
;;(line-number-mode t)

;; サーバ設定
(require 'server)
(cond (windows-p
       (defun server-ensure-safe-dir (dir) "Noop" t)))
;; 複数サーバ起動を防ぐ
(unless (server-running-p)
  (server-start))

;;
;; open file as root
;;______________________________________________________________________
(defun th-rename-tramp-buffer ()
  (when (file-remote-p (buffer-file-name))
    (rename-buffer
     (format "%s:%s"
             (file-remote-p (buffer-file-name) 'method)
             (buffer-name)))))

(add-hook 'find-file-hook
          'th-rename-tramp-buffer)

(defadvice find-file (around th-find-file activate)
  "Open FILENAME using tramp's sudo method if it's read-only."
  (if (and (not (file-writable-p (ad-get-arg 0)))
           (y-or-n-p (concat "File "
                             (ad-get-arg 0)
                             " is read-only.  Open it as root? ")))
      (th-find-file-sudo (ad-get-arg 0))
    ad-do-it))

(defun th-find-file-sudo (file)
  "Opens FILE with root privileges."
  (interactive "F")
  (set-buffer (find-file (concat "/sudo::" file))))

;; preview color
;; Don't work x(
(defun xah-syntax-color-hex ()
  "Syntax color text of the form 「#ff1100」 in current buffer.
URL `http://ergoemacs.org/emacs/emacs_CSS_colors.html'
Version 2015-06-11"
  (interactive)
  (font-lock-add-keywords
   nil
   '(("#[abcdef[:digit:]]\\{6\\}"
      (0 (put-text-property
          (match-beginning 0)
          (match-end 0)
          'face (list :background (match-string-no-properties 0)))))))
  (font-lock-fontify-buffer))
(add-hook 'emacs-lisp-mode 'xah-syntax-color-hex)

;; カーソル位置のブラウザを開く
(defun browse-url-at-point ()
  (interactive)
  (let ((url-region (bounds-of-thing-at-point 'url)))
    (when url-region
      (browse-url (buffer-substring-no-properties (car url-region)
                                                  (cdr url-region))))))

;; クリップボードとkill-ringを共有する
;; Emacs.app でうまく動かない
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
;; クリップボードを使用
(set-clipboard-coding-system 'utf-8)
(setq x-select-enable-clipboard t)
;; (defun copy-from-osx ()
;;   (shell-command-to-string "pbpaste"))
;; (defun paste-to-osx (text &optional push)
;;   (let ((process-connection-type nil))
;;     (let ((proc (start-process "pbcopy" "*Messages*" "pbcopy")))
;;       (process-send-string proc text)
;;       (process-send-eof proc))))

;; コマンド履歴を残す
(setq desktop-globals-to-save '(extended-command-history))
(setq desktop-files-not-to-save "")
(desktop-save-mode 1)

;; cmigemo 等パスの問題を修正
;; http://iriya-ufo.net/2014/03/19/368.html
(defun set-exec-path-from-shell-PATH ()
  "Set up Emacs' `exec-path' and PATH environment variable to match that used by the user's shell.
   This is particularly useful under Mac OSX, where GUI apps are not started from a shell."
  (interactive)
  (let ((path-from-shell (replace-regexp-in-string "[ \t\n]*$" "" (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq exec-path (split-string path-from-shell path-separator))))
(set-exec-path-from-shell-PATH)

;; 適切なファイルを開く
(defun my-x-open (file)
  "open file by a associated program."
  (interactive "FOpen File: ")
  (message "Opening %s..." file)
  (cond ((not window-system)
         (find-file file))
        ((eq system-type 'windows-nt)
         (call-process "cmd.exe" nil 0 nil "/c" "start" ""
               (convert-standard-filename file)))
        ((eq system-type 'darwin)
         (call-process "open" nil 0 nil file))
        (t
         (call-process "xdg-open" nil 0 nil file)))
  (if (functionp 'recentf-add-file)
    (recentf-add-file file))
  (message "Opening %s...done" file))

(defun dired-open-file ()
  "In dired, open the file named on this line."
  (interactive)
  (my-x-open (dired-get-filename)))

;;; 00-basic.el ends here
