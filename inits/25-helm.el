;;; 25-helm.el --- An Emacs framework for incremental completions and narrowing selections

;;; Commentary:

;;; Code:

(use-package helm
  :config
  (helm-mode 1)

  (use-package helm-config)
  (use-package helm-grep
    :config
    (define-key helm-grep-mode-map (kbd "<return>")  'helm-grep-mode-jump-other-window)
    (define-key helm-grep-mode-map (kbd "n")  'helm-grep-mode-jump-other-window-forward)
    (define-key helm-grep-mode-map (kbd "p")  'helm-grep-mode-jump-other-window-backward))

  ;; The default "C-x c" is quite close to "C-x C-c", which quits Emacs.
  ;; Changed to "C-c h". Note: We must set "C-c h" globally, because we
  ;; cannot change `helm-command-prefix-key' once `helm-config' is loaded.
  (global-set-key (kbd "C-c h") 'helm-command-prefix)
  (global-unset-key (kbd "C-x c"))

  (define-key helm-map (kbd "<tab>") 'helm-execute-persistent-action) ; rebihnd tab to do persistent action
  (define-key helm-map (kbd "C-i") 'helm-execute-persistent-action) ; make TAB works in terminal
  (define-key helm-map (kbd "C-z")  'helm-select-action) ; list actions using C-z
  (when (executable-find "curl")
    (setq helm-google-suggest-use-curl-p t))

  (setq helm-scroll-amount 4 ; scroll 4 lines other window using M-<next>/M-<prior>
        helm-ff-search-library-in-sexp t ; search for library in `require' and `declare-function' sexp.
        helm-split-window-in-side-p t ;; open helm buffer inside current window, not occupy whole other window
        helm-candidate-number-limit 500 ; limit the number of displayed canidates
        helm-ff-file-name-history-use-recentf t
        helm-move-to-line-cycle-in-source t ; move to end or beginning of source when reaching top or bottom of source.
        helm-buffers-fuzzy-matching t          ; fuzzy matching buffer names when non-nil
                                        ; useful in helm-mini that lists buffers
        )

  (add-to-list 'helm-sources-using-default-as-input 'helm-source-man-pages)

  (global-set-key (kbd "M-x") 'helm-M-x)
  (global-set-key (kbd "M-y") 'helm-show-kill-ring)
  (global-set-key (kbd "C-x b") 'helm-mini)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (global-set-key (kbd "C-h SPC") 'helm-all-mark-rings)
  (global-set-key (kbd "C-c h o") 'helm-occur)
  (global-set-key (kbd "C-c h C-c w") 'helm-wikipedia-suggest)
  (global-set-key (kbd "C-c h x") 'helm-register)
  ;; (global-set-key (kbd "C-x r j") 'jump-to-register)
  (define-key 'help-command (kbd "C-f") 'helm-apropos)
  (define-key 'help-command (kbd "r") 'helm-info-emacs)
  (define-key 'help-command (kbd "C-l") 'helm-locate-library)

  ;; use helm to list eshell history
  (add-hook 'eshell-mode-hook
            #'(lambda ()
                (define-key eshell-mode-map (kbd "M-l")  'helm-eshell-history)))

  ;; Save current position to mark ring
  (add-hook 'helm-goto-line-before-hook 'helm-save-current-pos-to-mark-ring)

  ;; show minibuffer history with Helm
  (define-key minibuffer-local-map (kbd "M-p") 'helm-minibuffer-history)
  (define-key minibuffer-local-map (kbd "M-n") 'helm-minibuffer-history)

  (define-key global-map [remap find-tag] 'helm-etags-select)
  (define-key global-map [remap list-buffers] 'helm-buffers-list)

  ;; 自動補完を無効
  (custom-set-variables '(helm-ff-auto-update-initial-value nil))

  ;; ミニバッファでC-hをバックスペースに割り当て
  (define-key helm-map (kbd "C-h") 'delete-backward-char)
  (define-key helm-find-files-map (kbd "C-h") 'delete-backward-char)

  ;; TABで補完
  (define-key helm-find-files-map (kbd "TAB") 'helm-execute-persistent-action)
  (define-key helm-read-file-map (kbd "TAB") 'helm-execute-persistent-action)

  (use-package migemo
    :config
    (helm-migemo-mode 1))

  (set-face-attribute 'helm-selection nil
                      :background "yellow"
                      :foreground "black")

  (helm-descbinds-install))

;;; 25-helm.el ends here
