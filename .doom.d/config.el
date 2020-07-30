;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "gumendol"
      user-mail-address "2654066323@qq.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-dracula)
;; (setq doom-font (font-spec :family "Source Code Pro" :size 14))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "/run/media/gumendol/rex/journal")
(setq +org-capture-todo-file "TODO.org")

(after! org
  ;; (let ((templates
  ;;        '(("pt" "Project todo" entry (file +org-capture-todo-file) "* TODO %?[[%:link][%:description]] %U\n" :prepend t)
  ;;           ("X" "Xotocol Link" entry (file "") "* TODO %?[[%:link][%:description]] %U\n" :prepend t))))
  ;;   (dolist (var templates)(add-to-list 'org-capture-templates var)))
  (setq org-capture-templates
    '(("t" "Personal todo" entry
      (file+headline +org-capture-todo-file "Inbox")
      "* [ ] %?\n%i\n%a" :prepend t)
    ("n" "Personal notes" entry
      (file+headline +org-capture-notes-file "Inbox")
      "* %u %?\n%i\n%a" :prepend t)
    ("j" "Journal" entry
      (file+olp+datetree +org-capture-journal-file)
      "* %U %?\n%i\n%a" :prepend t)

    ("p" "Templates for projects")
    ("pt" "Project-local todo" entry
      (file +org-capture-project-todo-file)
      "* TODO %?\n%i\n%a")
    ("pi" "Project-local idea" entry
      (file+headline +org-capture-project-todo-file "Ideas")
      "** %? %u\n%i\n%a")
    ;; ("pc" "Project-local changelog" entry
    ;;   (file+headline +org-capture-project-changelog-file "Unreleased")
    ;;   "* %U %?\n%i\n%a" :prepend t)

    ;; ("o" "Centralized templates for projects")
    ;; ("ot" "Project todo" entry #'+org-capture-central-project-todo-file "* TODO %?\n %i\n %a" :heading "Tasks" :prepend nil)
    ;; ("on" "Project notes" entry #'+org-capture-central-project-notes-file "* %U %?\n %i\n %a" :heading "Notes" :prepend t)
    ;; ("oc" "Project changelog" entry #'+org-capture-central-project-changelog-file "* %U %?\n %i\n %a" :heading "Changelog" :prepend t))
  ))
)
;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are
(require 'company)
(setq company-idle-delay 0.2
      company-minimum-prefix-length 3)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   (quote
    ("/run/media/gumendol/rex/journal/journal-2020.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
