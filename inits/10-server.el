
;;; Code:

(require 'server)

(unless (server-running-p) ;; 複数サーバ起動を防ぐ
  (server-start))

;;; 10-server.el ends here
