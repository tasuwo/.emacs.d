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

  (use-package mode-line-color
     :config (mode-line-color-mode t))

  :config
  ;; テーマのロード時に一々確認しない
  (setq sml/no-confirm-load-theme t)
  ;; アクティベート
  (sml/setup)

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
      (editorconfig-mode .      " EC")
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

(use-package persp-mode
  :config
  (persp-mode t))

(use-package eyebrowse-mode
  :init
  (eyebrowse-mode t))

(use-package window-numbering
  :config
  (defun window-numbering-install-mode-line (&optional position)
    "Do nothing."))

(use-package anzu
  :config
  (global-anzu-mode +1)
  (use-package evil-anzu))

(use-package org-pomodoro)

(use-package pyenv-mode
  :config
  (pyenv-mode))

(use-package fancy-battery-mode
  :config
  (add-hook 'after-init-hook #'fancy-battery-mode))

(use-package spaceline)
(use-package spaceline-config
  :init
  (setq powerline-height 20)
  (setq powerline-raw " ")
  (setq ns-use-srgb-colorspace nil)

  :config
  (spaceline-helm-mode t)
  (spaceline-info-mode t)
  (spaceline-spacemacs-theme)

  (setq powerline-default-separator 'wave)
  (setq spaceline-highlight-face-func 'spaceline-highlight-face-evil-state)
  (spaceline-highlight-face-evil-state)
  (spaceline-toggle-minor-modes-off)
  (spaceline-toggle-hud-off)

  (set-face-attribute 'spaceline-evil-emacs nil :background "#be84ff")
  (set-face-attribute 'spaceline-evil-insert nil :background "#5fd7ff")
  (set-face-attribute 'spaceline-evil-motion nil :background "#ae81ff")
  (set-face-attribute 'spaceline-evil-normal nil :background "#a6e22e")
  (set-face-attribute 'spaceline-evil-replace nil :background "#f92672")
  (set-face-attribute 'spaceline-evil-visual nil :background "#fd971f")

  (spaceline-compile))

;;; 10-mode-line.el ends here
