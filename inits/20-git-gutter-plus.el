
;;; Code:

(require 'git-gutter+)

(setq git-gutter+-modified-sign " ")
(setq git-gutter+-added-sign "+")
(setq git-gutter+-deleted-sign "-")

(set-face-background 'git-gutter+-modified "black")
(set-face-foreground 'git-gutter+-added "green")
(set-face-foreground 'git-gutter+-deleted "red")

(global-git-gutter+-mode)

;;; 20-git-gutter-plus.el ends here
