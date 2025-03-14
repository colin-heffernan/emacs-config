
;; Vertico
;; Adapted from https://github.com/minad/vertico
(use-package vertico
  :ensure t
  :init (vertico-mode))

;; Consult
;; Adapted from https://github.com/minad/consult
(use-package consult
  :ensure t
  :bind () ;; TODO
  :hook (completion-list-mode . consult-preview-at-point-mode)
  :init
  (advice-add #'register-preview :override #'consult-register-window)
  (setq register-preview-delay 0.5)
  (setq xref-show-xrefs-function #'consult-xref
	xref-show-definitions-function #'consult-xref)
  :config
  (consult-customize
   consult-theme :preview-key '(:debounce 0.2 any)
   consult-ripgrep consult-git-grep consult-grep consult-man
   consult-bookmark consult-recent-file consult-xref
   consult--source-bookmark consult--source-file-register
   consult--source-recent-file consult--source-project-recent-file
   :preview-key '(:debounce 0.4 any))
  (setq consult-narrow-key "<"))

;; Corfu
;; Adapted from https://github.com/minad/corfu
(use-package corfu
  :ensure t
  :init (global-corfu-mode))

;; Cape
;; Adapted from https://github.com/minad/cape
(use-package cape
  :ensure t
  :bind () ;; TODO
  :init
  (add-hook 'completion-at-point-functions #'cape-dabbrev)
  (add-hook 'completion-at-point-functions #'cape-file)
  (add-hook 'completion-at-point-functions #'cape-elisp-block))

;; Embark
;; Adapted from https://github.com/oantolin/embark
(use-package embark
  :ensure t
  :bind () ;; TODO
  :init (setq prefix-help-command #'embark-prefix-help-command)
  :config
  (add-to-list 'display-buffer-alist
	       '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
		 nil
		 (window-parameters (mode-line-format . none)))))

;; Embark for Consult
;; Adapted from https://github.com/oantolin/embark
(use-package embark-consult
  :ensure t
  :hook (embark-collect-mode . consult-preview-at-point-mode))

;; Marginalia
;; Adapted from https://github.com/minad/marginalia
(use-package marginalia
  :ensure t
  :bind () ;; TODO
  :init (marginalia-mode))

;; Orderless
;; Adapted from https://github.com/minad/vertico and https://github.com/minad/corfu
(use-package orderless
  :ensure t
  :custom
  (completion-styles '(orderless basic))
  (completion-category-defaults nil)
  (completion-category-overrides '((file (styles partial-completion)))))

;; Persist history for Vertico
;; Adapted from https://github.com/minad/vertico
(savehist-mode)

;; Configure Emacs for completion plugins
;; Adapted from https://github.com/minad/vertico and https://github.com/minad/corfu
(use-package emacs
  :ensure nil
  :custom
  (enable-recursive-minibuffers t)
  (read-extended-command-predicate #'command-completion-default-include-p)
  (minibuffer-prompt-properties
   '(read-only t cursor-intangible t face minibuffer-prompt))
  (tab-always-indent 'complete)
  (text-mode-ispell-word-completion nil)
  (read-extended-command-predicate #'command-completion-default-include-p))
