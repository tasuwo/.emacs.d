;;; 30-edit-mode-scala.el --- scala モード

;;; Commentary:

;;; Code:

(use-package scala-mode
  :mode (("\\.scala\\'" . scala-mode)))

(use-package sbt-mode
  :commands sbt-start sbt-command
  :config
  ;; WORKAROUND: https://github.com/ensime/emacs-sbt-mode/issues/31
  ;; allows using SPACE when in the minibuffer
  (substitute-key-definition
   'minibuffer-complete-word
   'self-insert-command
   minibuffer-local-completion-map))
