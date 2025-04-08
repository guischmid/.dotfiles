;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; USER INFO
(setq user-full-name "Gigi"
      user-mail-address "guilhermeschmid@proton.me")

;; THEME
(setq doom-theme 'doom-one)

;; LINE NUMBERS
(setq display-line-numbers-type t)

;; ORG DIRECTORY
(setq org-directory "~/notes")
(setq default-directory "~/notes/")

;; ORG AGENDA SETUP
(after! org
  (setq org-agenda-files
        (append
         ;; Alle agenda.org-Dateien in allen Semestern finden
         (directory-files-recursively "~/notes/uni/" "^agenda\\.org$")
         ;; Persönliche Agenda manuell ergänzen
         '("~/notes/personal/agenda.org"))))

;; ----------------------------------------
;; ORG ROAM CONFIGURATION (READY, NOT IN ACTIVE USE YET)
;; ----------------------------------------

(use-package! org-roam
  :after org
  :init
  (setq org-roam-directory "~/notes/uni")
  :custom
  (org-roam-completion-everywhere t)
  (org-roam-capture-autosave t)
  (org-roam-capture-kill-buffer-on-exit t)
  :config
  (org-roam-db-autosync-mode)

  ;; Custom capture template (inactive until you use it manually)
  (after! org-roam
    (setq org-roam-capture-templates
          '(("i" "Inbox Note" plain
             "%?"
             :target (file+head "inbox/${slug}.org"
                                "#+title: ${title}\n#+created: %U\n")
             :unnarrowed t)))))


;; ----------------------------------------
;; TREEMACS CONFIGURATION
;; ----------------------------------------

 (after! treemacs
  (setq treemacs-width 30
        treemacs-show-hidden-files t
        treemacs-follow-after-init t
        treemacs-indentation 2
        treemacs-is-never-other-window t))

;; ----------------------------------------
;; LATEX PREVIEW SETTINGS (SVG, CLEAN LOOK)
;; ----------------------------------------

(after! org
  (setq org-format-latex-options
        (plist-put org-format-latex-options :scale 1.5))
  (setq org-preview-latex-default-process 'dvisvgm)
  (setq org-startup-with-latex-preview t))

;; Manual refresh shortcut
(map! :leader
      :desc "Reload LaTeX Preview"
      "m r" (lambda () (interactive)
              (org-clear-latex-preview)
              (org-latex-preview)))

;; ----------------------------------------
;; COMPLETION + MATH
;; ----------------------------------------

(after! org
  (add-hook 'org-mode-hook #'company-mode)
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.0))

(after! company
  (add-to-list 'company-backends 'company-math-symbols-latex))

;; Smartparens for LaTeX math
(after! smartparens
  (sp-local-pair 'org-mode "\\(" "\\)")
  (sp-local-pair 'org-mode "\\[" "\\]"))

;; ----------------------------------------
;; ORG AESTHETICS
;; ----------------------------------------

(use-package! org-superstar
  :hook (org-mode . org-superstar-mode)
  :config
  (setq org-superstar-headline-bullets-list '("•" "◦" "‣" "∙"))
  (setq org-superstar-leading-bullet " "))

(setq org-hide-emphasis-markers t)

;(custom-set-faces!
;  '(org-level-1 :inherit outline-1 :height 1.5 :weight semi-bold)
;  '(org-level-2 :inherit outline-2 :height 1.3 :weight semi-bold)
;  '(org-level-3 :inherit outline-3 :height 1.15 :weight semi-bold)
;  '(org-level-4 :inherit outline-4 :height 1.1 :weight normal)
;  '(org-level-5 :inherit outline-5 :height 1.0 :weight normal)
;  '(org-level-6 :inherit outline-6 :height 1.0 :weight normal))

;; ----------------------------------------
;; MAC KEYBOARD TWEAKS (for German layout)
;; ----------------------------------------

(setq mac-option-modifier 'none)
(setq mac-right-option-modifier 'meta)
