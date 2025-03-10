;; Evil Mode
(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  :config (evil-mode))

;; Evil Collection
(use-package evil-collection
  :ensure t
  :after evil
  :config (evil-collection-init))
