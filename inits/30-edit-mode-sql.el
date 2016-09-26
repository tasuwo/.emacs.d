;;; 30-edit-mode-sql.el

;;; Commentary:

;;; Code:

(use-package sql
  :mode (("\\.sql\\'" . sql-mode))
  :init
  (load-library "sql-indent")
  ;; (load-library "sql-complete")
  ;; (load-library "sql-transform")
  )

;;; 30-edit-mode-sql.el ends here
