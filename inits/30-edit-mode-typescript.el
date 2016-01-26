
;;; Code:

(use-package typescript-mode)
(add-to-list 'auto-mode-alist '("\\.ts\\'" . typescript-mode))

;; tide
(use-package tide)
(add-hook 'typescript-mode-hook
          (lambda ()
            (tide-setup)
            (flycheck-mode t)
            (setq flycheck-check-syntax-automatically '(save mode-enabled))
            (eldoc-mode t)
            (company-mode-on)))

;; company
(use-package company)
(setq company-minimum-prefix-length 1) ;; 1文字入力で補完されるように
 ;;; 候補の一番上でselect-previousしたら一番下に、一番下でselect-nextしたら一番上に行くように
(setq company-selection-wrap-around t)

;;; 色の設定。出来るだけ奇抜にならないように
(set-face-attribute 'company-tooltip nil
                    :foreground "black"
                    :background "lightgray")
(set-face-attribute 'company-preview-common nil
                    :foreground "dark gray"
                    :background "black"
                    :underline t)
(set-face-attribute 'company-tooltip-selection nil
                    :background "steelblue"
                    :foreground "white")
(set-face-attribute 'company-tooltip-common nil
                    :foreground "black"
                    :underline t)
(set-face-attribute 'company-tooltip-common-selection nil
                    :foreground "white"
                    :background "steelblue"
                    :underline t)
(set-face-attribute 'company-tooltip-annotation nil
                    :foreground "red")

;;; 30-edit-mode-typescript.el ends here
