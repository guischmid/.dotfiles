;;; init.el -*- lexical-binding: t; -*-

(doom! :completion
       (vertico +icons)
       (corfu +orderless)

       :ui
       doom
       doom-dashboard
       hl-todo
       modeline
       ophints
       (popup +defaults)
       (vc-gutter +pretty)
       vi-tilde-fringe
       treemacs
       treemacs-evil

       :editor
       (evil +everywhere)
       file-templates
       fold

       :emacs
       dired
       electric
       undo
       vc

       :checkers
       ;; syntax            ; enable later if writing code
       ;; (spell +flyspell) ; enable later if writing lots of text

       :tools
       (eval +overlay)

       lookup
       magit
       ;; (lsp +eglot)     ; disable for now to keep load time down

       :os
       (:if (featurep :system 'macos) macos)

       :lang
       emacs-lisp
       latex
       markdown
       (org +pretty +roam2)
       sh

       :app
       calendar
       
       :config
       (default +bindings +smartparens))
