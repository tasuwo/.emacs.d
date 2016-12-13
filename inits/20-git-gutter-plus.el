;;; 20-git-gutter-plus.el --- gutter area に Git 情報を付加する

;;; Commentary:

;;; Code:

(when (require 'git-gutter+ nil 'noerror)
  (use-package git-gutter+
    :config
    (setq git-gutter+-modified-sign "!")
    (setq git-gutter+-added-sign "+")
    (setq git-gutter+-deleted-sign "-")

    (set-face-foreground 'git-gutter+-modified "yellow")
    (set-face-foreground 'git-gutter+-added    "green")
    (set-face-foreground 'git-gutter+-deleted  "red")

    (global-git-gutter+-mode)

    ;; fringe に git 情報を載せる
    (use-package git-gutter-fringe+
      :config
      (set-face-foreground 'git-gutter-fr+-modified "yellow")
      (set-face-foreground 'git-gutter-fr+-added    "green")
      (set-face-foreground 'git-gutter-fr+-deleted  "red"))))

;;; 20-git-gutter-plus.el ends here
