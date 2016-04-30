
;;; Code:

(use-package quickrun)

(quickrun-add-command "coffee-compile"
                      '((:command . "coffee")
                        (:exec . "%c --compile --print %s")
                        (:outputter . (lambda () (javascript-generic-mode))))
                      :default "coffee")
(require 'generic-x)

;;; 20-quickrun.el ends here
