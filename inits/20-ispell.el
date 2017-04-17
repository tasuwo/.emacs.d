;;; ispell.el --- スペルチェック

;;; Commentary:

;;; Code:

(use-package ispell
  :config
  (setq-default ispell-program-name "/usr/local/bin/ispell"))

(use-package flyspell
  :config
  (flyspell-mode 1))

;;; 20-ispell.el ends here
