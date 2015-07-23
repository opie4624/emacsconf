(require 'package)
(add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)                ;; Initialize & Install Package
(unless package-archive-contents    ;; Refresh the packages descriptions
  (package-refresh-contents))
(setq package-load-list '(all))     ;; List of packages to load
(unless (package-installed-p 'org)  ;; Make sure the Org package is
  (package-install 'org))           ;; installed, install it if not
(package-initialize)                ;; Initialize & Install Package

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (zenburn)))
 '(custom-safe-themes
   (quote
    ("ebe862b54fe8d3c9189a0d7c218565a669abab09e3b504b68797a2f254fc3b0d" default)))
 '(diary-file "~/Dropbox/diary")
 '(org-agenda-files
   (quote
    ("~/Dropbox/OrgMode/" "~/Dropbox/OrgMode/Personal/" "~/Dropbox/OrgMode/Work/")))
 '(org-clock-into-drawer "LOGBOOK")
 '(org-clock-persist t)
 '(org-clock-persist-query-save t)
 '(org-completion-use-ido t)
 '(org-crypt-key "E9053BDA")
 '(org-default-notes-file "~/Dropbox/OrgMode/Inbox.org")
 '(org-directory "~/Dropbox/OrgMode")
 '(org-enforce-todo-checkbox-dependencies t)
 '(org-export-backends (quote (ascii html icalendar latex md confluence deck)))
 '(org-extend-today-until 2)
 '(org-log-done (quote time))
 '(org-log-into-drawer t)
 '(org-mobile-directory "~/Dropbox/MobileOrg")
 '(org-mobile-inbox-for-pull "~/Dropbox/OrgMode/from-mobile.org")
 '(org-modules
   (quote
    (org-bbdb org-bibtex org-crypt org-docview org-gnus org-habit org-info org-irc org-mhe org-mouse org-rmail org-w3m org-drill org-expiry org-jira org-learn org-secretary org-toc org-track)))
 '(org-refile-allow-creating-parent-nodes t)
 '(org-refile-targets (quote ((org-agenda-files :maxlevel . 2))))
 '(org-refile-use-outline-path t)
 '(org-use-speed-commands t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(ido-mode 1)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)

;(add-to-list 'load-path' "~/.emacs.d")


(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;(setq mac-command-modifier 'meta) ; sets the Command key as Meta
;(setq mac-option-modifier 'super) ; sets the Option key as Super
;(setq ns-function-modifier 'hyper) ; set Mac's Fn key to type Hyper
(setq ns-function-modifier 'super) ; set Mac's Fn key to type Super

(setq load-path (cons  "/usr/local/lib/erlang/lib/tools-2.7.2/emacs"
      load-path))
(setq erlang-root-dir "/usr/local/lib/erlang")
(setq exec-path (cons "/usr/local/lib/erlang/bin" exec-path))
(require 'erlang-start)

(add-to-list 'load-path "~/.emacs.d/simple-rtm/lisp")
(autoload 'simple-rtm-mode "simple-rtm" "Interactive Mode for Remember The Milk" t)
