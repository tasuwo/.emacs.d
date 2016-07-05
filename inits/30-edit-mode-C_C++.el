;;; 30-edit-mode-C_C++.el --- Major mode for C/C++

;;; Commentary:

;;; Code:

(use-package c-mode
  :mode (("\\.c\\'" . c-mode))
  :init
  (add-hook 'c-mode-hook
            (lambda ()
              (setq-default c-basic-offset 4
                            tab-width 4
                            indent-tabs-mode nil)
              (c-set-style "stroustrup")
              (show-paren-mode t))))
(use-package c++-mode
  :mode (("\\.h\\'" . c++-mode)
         ("\\.cpp\\'" . c++-mode))
  :init
  (add-hook 'c++-mode-hook
            (lambda ()
              (setq-default c-basic-offset 4
                            tab-width 4
                            indent-tabs-mode nil)
              (c-set-style "stroustrup")
              (show-paren-mode t))))

;; ヘッダーの補完
(use-package auto-complete-c-headers
  :requires 'auto-complete
  :commands (c-mode c++-mode)
  :config
  (add-to-list 'ac-sources 'ac-source-c-headers))

;; clang を使用した補完
(use-package auto-complete-clang-async
  :commands (c-mode c++-mode)
  :config
  (add-hook 'auto-complete-mode-hook 'ac-common-setup)
  (setq ac-clang-complete-executable "/usr/local/bin/clang-complete")
  (setq ac-sources '(ac-source-clang-async))
  (ac-clang-launch-completion-process))

;; doxymacs
(use-package doxymacs
  :init
  (add-hook 'c-mode-hook 'doxymacs-mode)
  (add-hook 'c++-mode-hook 'doxymacs-mode)
  :config
  (setq doxymacs-doxygen-style "JavaDoc"))

;;; 30-edit-mode-C_C++.el ends here
