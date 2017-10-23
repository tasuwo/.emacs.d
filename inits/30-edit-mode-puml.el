;;; 30-edit-mode-puml.el --- Major mode for plantUML

;;; Commentary:

;;; Code:

(use-package plantuml-mode
  :mode (("\\.puml\\'" . plantuml-mode)
         ("\\.plantuml\\'" . plantuml-mode)))

;;; 30-edit-mode-puml.el ends here
