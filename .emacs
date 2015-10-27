(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (zenburn)))
 '(custom-safe-themes
   (quote
    ("26614652a4b3515b4bbbb9828d71e206cc249b67c9142c06239ed3418eff95e2" "ebe862b54fe8d3c9189a0d7c218565a669abab09e3b504b68797a2f254fc3b0d" default)))
 '(diary-file "~/Dropbox/OrgMode/Diary.org")
 '(ido-enable-flex-matching t)
 '(ido-everywhere t)
 '(org-agenda-files
   (quote
    ("~/Dropbox/OrgMode/" "~/Dropbox/OrgMode/Personal/" "~/Dropbox/OrgMode/Work/")))
 '(org-agenda-include-diary nil)
 '(org-clock-idle-time 10)
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
    (org-bbdb org-bibtex org-crypt org-docview org-gnus org-habit org-info org-irc org-mhe org-mouse org-rmail org-w3m org-expiry org-mac-link org-secretary org-toc org-track)))
 '(org-refile-allow-creating-parent-nodes t)
 '(org-refile-targets (quote ((org-agenda-files :maxlevel . 2))))
 '(org-refile-use-outline-path t)
 '(org-use-speed-commands t)
 '(package-archives
   (quote
    (("gnu" . "http://elpa.gnu.org/packages/")
     ("melpa" . "http://melpa.org/packages/")
     ("org" . "http://orgmode.org/elpa/"))))
 '(sml/theme (quote powerline)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(defun package-check-and-install (&rest pkgs)
  "Utility function to install packages if not already installed"
  (require 'package)
  (package-initialize)
  (unless package-archive-contents
    (package-refresh-contents))
  (dolist (pkg pkgs)
    (unless (package-installed-p pkg)
      (package-install pkg))))

(package-check-and-install
 'org-plus-contrib 'alchemist 'elixir-mode 'minimap 'beacon 'smart-mode-line-powerline-theme 'dash-at-point)

;(dolist (key "\C-cD" "\C-cW" "\C-cd" "\C-cj" "\C-cw")
;  global-unset-key key)

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)

;(setq mac-command-modifier 'meta) ; sets the Command key as Meta
;(setq mac-option-modifier 'super) ; sets the Option key as Super
;(setq ns-function-modifier 'hyper) ; set Mac's Fn key to type Hyper
(setq ns-function-modifier 'super) ; set Mac's Fn key to type Super


(add-to-list 'load-path "~/.emacs.d/simple-rtm/lisp")
(autoload 'simple-rtm-mode "simple-rtm" "Interactive Mode for Remember The Milk" t)

(dolist (file (directory-files "~/.emacs.d/system" t "\.el$" nil))
  (load (file-name-sans-extension file)))

(add-hook 'after-init-hook 'global-company-mode)
(add-hook 'after-init-hook 'beacon-mode 1)
(add-hook 'after-init-hook 'ido-mode 1)
(add-hook 'after-init-hook 'sml/setup)

(add-hook 'org-mode-hook (lambda()
			   (define-key org-mode-map (kbd "C-c g") 'org-mac-grab-link)))

(defadvice ido-find-file (after find-file-sudo activate)
  "Find file as root if necessary."
  (unless (and buffer-file-name
               (file-writable-p buffer-file-name))
    (find-alternate-file (concat "/sudo:root@localhost:" buffer-file-name))))
