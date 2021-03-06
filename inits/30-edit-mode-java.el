;;; 30-edit-mode-java.el

;;; Commentary:

;;; Code:

(use-package jde-mode
  :disabled t
  :mode ("\\.java\\'" . jde-mode)
  :init
  (progn
    (add-hook 'jde-mode-hook (lambda ()  (c-set-style "java")))
    (autoload 'jde-mode "jde" "jde mode" t)
    (setq jde-bug-debugger-host-address "127.0.0.1")
    (setq jde-bug-jre-home "/usr/lib/jvm/java-1.7.0-openjdk-amd64/")
    (setq jde-compile-option-debug (quote ("all" (t nil nil))))
    (setq jde-debugger (quote ("jdb")))
    (setq jde-global-classpath (split-string (or (getenv "CLASSPATH") "") ":"))
    (setq jde-jdk-doc-url "/usr/share/doc/openjdk-7-doc/html/api/index.html")
    (setq jde-jdk-registry (quote (("1.7.0" . "/usr/lib/jvm/java-7-openjdk-amd64/"))))
    (setq jde-jdk (quote ("1.7.0")))
    (setq jde-regexp-jar-file "/usr/share/java/regexp.jar")
    (setq jde-sourcepath (quote (".")))))

;;; 30-edit-mode-java.el ends here
