(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-install 'use-package))
(setq use-package-always-ensure t)

(if (eq system-type 'windows-nt)
  (set-face-attribute 'default nil :family "Consolas" :height 110)
)

(use-package toc-org
  :ensure t
  :after org
  :hook (org-mode . toc-org-mode)
)

(use-package org-auto-tangle
  :ensure t
  :after org
  :defer t
  :hook (org-mode . org-auto-tangle-mode)
)

(use-package magit
:ensure t)

(use-package evil
  :init
  (setq evil-want-keybinding nil)
  (evil-mode)
  )

(use-package evil-collection
  :after evil
  :ensure t
  :config
  (evil-collection-init))

(electric-pair-mode 1)

(add-hook 'text-mode-hook (setq electric-indent-mode nil))

(use-package nix-mode
  :mode "\\.nix\\'")

(use-package systemd
  :ensure t)

(use-package jade-mode
:ensure t)
