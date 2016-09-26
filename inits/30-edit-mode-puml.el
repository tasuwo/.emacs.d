;;; 30-edit-mode-puml.el --- Major mode for plantUML

;;; Commentary:

;;; Code:

(use-package puml-mode
  :mode (("\\.puml\\'" . puml-mode)
         ("\\.plantuml\\'" . puml-mode))
  :config
  (setq puml-plantuml-jar-path "/Users/tozawa/plantuml.jar"))

;;; 30-edit-mode-puml.el ends here
