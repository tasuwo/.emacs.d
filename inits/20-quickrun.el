;;; 20-quickrun.el --- Build sources simplly

;;; Commentary:

;;; Code:

(use-package quickrun
  :config
  (quickrun-add-command "coffee-compile"
                        '((:command . "coffee")
                          (:exec . "%c --compile --print %s")
                          (:outputter . (lambda () (javascript-generic-mode))))
                        :default "coffee"))

(use-package generic-x
  :requires quickrun)

;;; 20-quickrun.el ends here
