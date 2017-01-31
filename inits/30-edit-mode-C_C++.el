;;; 30-edit-mode-C_C++.el --- Major mode for C/C++

;;; Commentary:

;;; Code:

(use-package c-mode
  :mode (("\\.c\\'" . c-mode))
  :init
  (add-hook 'c-mode-hook
            (lambda ()
              (use-package doxymacs
                :config
                (setq doxymacs-doxygen-style "JavaDoc"))

              (setq-default c-basic-offset 4
                            tab-width 4
                            indent-tabs-mode nil)
              (c-set-style "stroustrup")
              (show-paren-mode t))))

(use-package c++-mode
  :mode (("\\.h\\'" . c++-mode)
         ("\\.cpp\\'" . c++-mode))
  :init
  ;; This hack fixes indentation for C++11's "enum class" in Emacs.
  ;; http://stackoverflow.com/questions/6497374/emacs-cc-mode-indentation-problem-with-c0x-enum-class/6550361#6550361
  (defun inside-class-enum-p (pos)
    "Checks if POS is within the braces of a C++ \"enum class\"."
    (ignore-errors
      (save-excursion
        (goto-char pos)
        (up-list -1)
        (backward-sexp 1)
        (or (looking-back "enum\\s-+class\\s-+")
          (looking-back "enum\\s-+class\\s-+\\S-+\\s-*:\\s-*")))))

  (defun align-enum-class (langelem)
    (if (inside-class-enum-p (c-langelem-pos langelem))
        0
      (c-lineup-topmost-intro-cont langelem)))

  (defun align-enum-class-closing-brace (langelem)
    (if (inside-class-enum-p (c-langelem-pos langelem))
        '-
      '+))

  (defun fix-enum-class ()
    "Setup `c++-mode' to better handle \"class enum\"."
    (interactive)
    (add-to-list 'c-offsets-alist '(topmost-intro-cont . align-enum-class))
    (add-to-list 'c-offsets-alist
                 '(statement-cont . align-enum-class-closing-brace)))

  (add-hook 'c++-mode-hook
            (lambda ()
              (use-package doxymacs
                :config
                (setq doxymacs-doxygen-style "JavaDoc"))

              (setq-default c-basic-offset 4
                            tab-width 4
                            indent-tabs-mode nil)
              (c-set-style "stroustrup")
              (show-paren-mode t))))

;; doxymacs
(use-package doxymacs
  :init
  (add-hook 'c-mode-hook 'doxymacs-mode)
  (add-hook 'c++-mode-hook 'doxymacs-mode)
  :config
  (setq doxymacs-doxygen-style "JavaDoc"))

;;; 30-edit-mode-C_C++.el ends here
