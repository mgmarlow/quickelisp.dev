;;; publish.el --- Build quickelisp.dev  -*- lexical-binding: t; -*-
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))

(use-package weblorg :ensure t)

(weblorg-site
 :template-vars '(("site_name" . "start emacs")
                  ("site_owner" . "yo@quickelisp.dev")
                  ("site_description" . "Start your Emacs configuration with a single command.")))

(weblorg-route
 :name "pages"
 :input-pattern "pages/*.org"
 :template "page.html"
 :output "output/{{ slug }}.html"
 :url "/{{ slug }}.html")

(weblorg-copy-static
 :output "output/static/{{ file }}"
 :url "/static/{{ file }}")

(weblorg-export)
;;; publish.el ends here
