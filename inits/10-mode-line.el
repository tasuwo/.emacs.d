;;; 10-mode-line.el --- モードラインのカスタマイズ

;;; Commentary:

;; 参考サイト
;; http://blog.shibayu36.org/entry/2014/04/01/094543
;; smart-mode-line
;; https://github.com/Malabarba/smart-mode-line

;;; Code:

(use-package smart-mode-line
  :init
  ;; 行番号と列番号を表示する
  (line-number-mode t)
  (column-number-mode t)

  ;; 猫を表示する
  (use-package nyan-mode
    :config
    (nyan-mode t)
    (setq nyan-bar-length 14)
    (setq nyan-wavy-trail t))

  (use-package mode-line-color
     :config (mode-line-color-mode t))

  ;; vim モードの表示
  (use-package evil-mode-line
    :config
    (custom-set-faces
     '(modeline-evil-normal-state
       ((t (:background "darkolivegreen"
            :foreground "black"))))
     '(modeline-evil-insert-state
       ((t (:background "#500000"
            :foreground "black"))))
     '(modeline-evil-replace-state
       ((t (:background "chocolate1"
            :foreground "black"))))
     '(modeline-evil-visual-state
       ((t (:background "#55295b"
            :foreground "black"))))
     '(modeline-evil-emacs-state
       ((t (:background "gray50"
            :foreground "black"))))))

  :config
  ;; テーマのロード時に一々確認しない
  (setq sml/no-confirm-load-theme t)
  ;; アクティベート
  (sml/setup)
  (setq sml/theme 'dark)

  ;; モードラインのフォーマット設定
  (setq-default mode-line-format
   '(" "
     ;; モード表示(evil-mode)
     (:eval
      (format "<%s>"
              (case evil-state
                ((normal)  evil-normal-state-msg)
                ((insert)  evil-insert-state-msg)
                ((visual)  evil-visual-state-msg)
                ((replace) evil-replace-state-msg)
                ((emacs)   evil-emacs-state-msg)
                (t         evil-emacs-state-msg)
                ((nil)     evil-emacs-state-msg))))
     mode-line-mule-info
     mode-line-modified
     mode-line-frame-identification
     mode-line-buffer-identification
     " "
     ;; major/minor モード表示
     "%[("
     mode-name
     mode-line-process
     minor-mode-alist
     ")%] "
     ;; 猫の表示
     ("" (:eval (list (nyan-create))))
     " %[("
     ;; 行番号表示
     (line-number-mode "L%l")
     ("" (:eval (format "/%s" (line-number-at-pos (point-max)))))
     ;; 列番号表示
     (column-number-mode " C%c")
     "%])"))

  ;; 各種モードの文字列定義
  (defvar mode-line-cleaner-alist
    '(
      ;; minor mode
      (auto-complete-mode .     " AC")
      (flycheck-mode .          " FC")
      (yas-minor-mode .         " YS")
      (multiple-cursors-mode .  " MC")
      (paredit-mode .           "")
      (eldoc-mode .             "")
      (smartparens-mode .       "")
      (whitespace-mode .        "")
      (global-whitespace-mode . "")
      (undo-tree-mode .         "")
      (elisp-slime-nav-mode .   "")
      (abbrev-mode .            "")
      (helm-gtags-mode .        " HeG")
      (helm-migemo-mode .       " HeM")
      (helm-mode .              " He")
      (git-gutter+-mode .       "")
      (ace-isearch-mode .       "")
      (shell-mode .             "")
      (auto-revert-mode .       "")
      (lisp-interaction-mode .  "")
      (semantic-mode .                       " Se")
      (global-semanticdb-minor-mode .        " SeDB")
      (global-semantic-idle-scheduler-mode . " SeSC")
      (company-mode . " CO")
      ;; major mode
      (python-mode     . "Python")
      (ruby-mode       . "Ruby")
      (emacs-lisp-mode . "EmacsLisp")
      (markdown-mode   . "Markdown")
      (c-mode          . "Clang")
      (c++-mode        . "C++")
      (swift-mode      . "Swift")
      (web-mode        . "Web")
      (javascript-mode . "JavaScript")
      (slim-mode       . "Slim")
      (coffee-mode     . "CoffeeScript")
      (matlab-mode     . "Matlab")
      (php-mode        . "PHP")
      (typescript-mode . "TypeScript")))

  (defun clean-mode-line ()
    "定義した各種モードの文字列を描画"
    (interactive)
    (loop for (mode . mode-str) in mode-line-cleaner-alist
          do
          (let ((old-mode-str (cdr (assq mode minor-mode-alist))))
            (when old-mode-str
              (setcar old-mode-str mode-str))
            ;; major mode
            (when (eq mode major-mode)
              (setq mode-name mode-str)))))

  (add-hook 'after-change-major-mode-hook
            'clean-mode-line))


;;; 10-mode-line.el ends here
