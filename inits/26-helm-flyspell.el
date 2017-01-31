;;; helm-flyspell.el --- flyspell のための helm インタフェース

;;; Commentary:

;;; Code:

(use-package helm-flyspell
  :config
  (define-key flyspell-mode-map (kbd "C-;") 'helm-flyspell-correct))

;;; 26-helm-flyspell.el ends here
