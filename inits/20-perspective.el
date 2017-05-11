(require 'perspective)
(persp-mode 1)
;;; モードラインに現在のみのperspective名を表示させるように再定義
(defun persp-update-modestring ()
  (when persp-show-modestring
    (setq persp-modestring
          (list (nth 0 persp-modestring-dividers)
                (persp-name persp-curr)
                (nth 1 persp-modestring-dividers)))))

(defun persp-register-buffers-on-create ()
  (interactive)
  (dolist (bufname (condition-case _
                       (helm-comp-read
                        "Buffers: "
                        (mapcar 'buffer-name (buffer-list))
                        :must-match t
                        :marked-candidates t)
                     (quit nil)))
    (persp-add-buffer (get-buffer bufname))))
(add-hook 'persp-created-hook 'persp-register-buffers-on-create)
