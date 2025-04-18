;;; config.el --- Minimal Doom Emacs config

;(setq user-full-name "Your Name"
 ;     user-mail-address "you@example.com")

;; Theme
(setq doom-theme 'doom-one)

;; Org base directory
(setq org-directory "~/notes")
(setq default-directory "~/notes")

;; Org Agenda (personal + all semester agendas)
(after! org
  (setq org-agenda-files
        (append
         (directory-files-recursively "~/notes/uni/" "^agenda\\.org$")
         '("~/notes/personal/agenda.org"))))

;; Org-roam (ready but not actively used)
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
  ;; Inbox-style capture
  (setq org-roam-capture-templates
        '(("i" "Inbox Note" plain
           "%?"
           :target (file+head "inbox/${slug}.org"
                              "#+title: ${title}\n#+created: %U\n")
           :unnarrowed t))))

;; LaTeX preview
(after! org
  (setq org-format-latex-options
        (plist-put org-format-latex-options :scale 1.5))
  (setq org-preview-latex-default-process 'dvisvgm)
  (setq org-startup-with-latex-preview t))

;; Manual preview refresh
(map! :leader
      :desc "Reload LaTeX Preview"
      "m r" (lambda () (interactive)
              (org-clear-latex-preview)
              (org-latex-preview)))

;; Completion & Math symbols
(after! org
  (add-hook 'org-mode-hook #'company-mode)
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.0))

(after! company
  (add-to-list 'company-backends 'company-math-symbols-latex))

;; Smartparens LaTeX pairs
(after! smartparens
  (sp-local-pair 'org-mode "\\(" "\\)")
  (sp-local-pair 'org-mode "\\[" "\\]"))

;; Hide markers (*bold*, /italic/, etc.)
(setq org-hide-emphasis-markers t)

;; macOS option key fix
(setq mac-option-modifier 'none)
(setq mac-right-option-modifier 'meta)
