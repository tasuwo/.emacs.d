;;; 20-git-gutter-plus.el --- Git client for emacs

;;; Commentary:

;;; Code:

(use-package git-gutter+
  :config
  (setq git-gutter+-modified-sign "!")
  (setq git-gutter+-added-sign "+")
  (setq git-gutter+-deleted-sign "-")

  (set-face-foreground 'git-gutter+-modified "yellow")
  (set-face-foreground 'git-gutter+-added    "green")
  (set-face-foreground 'git-gutter+-deleted  "red")

  (global-git-gutter+-mode))

(use-package git-gutter-fringe+
  :requires git-gutter+
  :config
  (set-face-foreground 'git-gutter-fr+-modified "yellow")
  (set-face-foreground 'git-gutter-fr+-added    "green")
  (set-face-foreground 'git-gutter-fr+-deleted  "red"))

;;; 20-git-gutter-plus.el ends here
