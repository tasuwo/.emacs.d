
;;; Code:
;; http://blog.shibayu36.org/entry/2014/04/01/094543

;; smart-mode-line
(use-package smart-mode-line)
(setq sml/theme 'dark)
(sml/setup)

;; nyan-mode
(require 'nyan-mode)
(nyan-mode t)
(setq nyan-bar-length 14)
(setq nyan-wavy-trail t)

(line-number-mode t)
(column-number-mode t)
(setq-default mode-line-format
              '(" "
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
                ;;global-mode-string
                "%[("
                mode-name
                mode-line-process
                minor-mode-alist
                ")%] "
                ("" (:eval (list (nyan-create))))
                 " %[("
                (line-number-mode "L%l")
                ("" (:eval (format "/%s" (line-number-at-pos (point-max)))))
                (column-number-mode " C%c")
                "%])"))

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
  (interactive)
  (loop for (mode . mode-str) in mode-line-cleaner-alist
        do
        (let ((old-mode-str (cdr (assq mode minor-mode-alist))))
          (when old-mode-str
            (setcar old-mode-str mode-str))
          ;; major mode
          (when (eq mode major-mode)
            (setq mode-name mode-str)))))

(add-hook 'after-change-major-mode-hook 'clean-mode-line)

;;; 10-mode-line.el ends here
