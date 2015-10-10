
;;; Code:

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;; python
(add-hook 'python-mode-hook
          '(lambda()
             (setq indent-tabs-mode t)
             (setq indent-level 4)
             (setq python-indent 4)
             (setq tab-width 4)))

(add-hook 'python-mode-hook 'jedi:setup)
(setq jedi:setup-keys t)
(require 'jedi)
(setq jedi:complete-on-dot t)

;;; 30-edit-mode-python.el ends here
