;;; package -- global
;;; Commentary:
;;; Code:

;; ==============================================
;; Project
;; ==============================================
(use-package
  counsel-projectile
  :ensure t
  :after (projectile)
  :config (counsel-projectile-mode t))
(use-package
  projectile
  :ensure t
  :after (evil-leader)
  :config (projectile-mode)
  (evil-leader/set-key "p" 'projectile-command-map)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map))
(use-package
  magit
  :ensure t
  :config (evil-leader/set-key "g" 'magit-status))

;; ==============================================
;; Ivy Counsel Swiper
;; ==============================================
(use-package
  smex
  :ensure t)
(use-package
  ivy
  :ensure t
  :config (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  (setq ivy-initial-inputs-alist nil)
  (ivy-mode t))
(use-package
  counsel
  :ensure t
  :bind ("M-x" . counsel-M-x)
  ("C-x C-f" . counsel-find-file)
  ("C-h v" . counsel-describe-variable)
  ("C-h f" . counsel-describe-function))
(use-package
  swiper
  :ensure t
  :bind ("C-s" . swiper)
  :config (evil-leader/set-key "s" 'swiper))

;; ==============================================
;; Theme
;; ==============================================
(use-package
  hydra
  :ensure t)
(use-package
  doom-themes
  :ensure t
  :config (load-theme 'doom-one t))
;; Modeline theme
(use-package doom-modeline
  :ensure t
  :hook (after-init . doom-modeline-mode)
  :config (setq doom-modeline-height 25
                doom-modeline-bar-width 3
                doom-modeline-icon nil
                doom-modeline-enable-word-count 10
                doom-modeline-buffer-file-name-style 'file-name))

;; ==============================================
;; Better Enhancement
;; ==============================================

(use-package
  ace-jump-mode
  :ensure t
  :after evil-leader
  :config (evil-leader/set-key "j" 'ace-jump-mode))

(use-package
  which-key
  :ensure t
  :defer 1
  :config (setq which-key-idle-delay 0.01)
  (setq which-key-idle-secondary-delay 0)
  (which-key-mode t))

(use-package
  undo-tree
  :ensure t
  :config (global-undo-tree-mode))

;; Better delete
(use-package
  hungry-delete
  :ensure t
  :defer 1
  :config (global-hungry-delete-mode))
;; Mark tool
(use-package
  expand-region
  :ensure t
  :after evil-leader
  :config (evil-leader/set-key "m r" 'er/expand-region)
  (evil-leader/set-key "m f" 'er/mark-defun)
  (evil-leader/set-key "m a" 'mark-page)
  (evil-leader/set-key "m s" 'er/mark-symbol)
  (evil-leader/set-key "m u" 'er/mark-url)
  (evil-leader/set-key "m c" 'er/mark-comment)
  (evil-leader/set-key "m w" 'er/mark-word)
  (evil-leader/set-key "m p i" 'er/mark-inside-pairs)
  (evil-leader/set-key "m p o" 'er/mark-outside-pairs)
  (evil-leader/set-key "m q i" 'er/mark-inside-quotes)
  (evil-leader/set-key "m q o" 'er/mark-outside-quotes))

;; Highlight indent
(use-package
  highlight-indent-guides
  :ensure t
  :config
  (setq highlight-indent-guides-method 'character)
  ;; (setq highlight-indent-guides-character ?\|)
  (setq highlight-indent-guides-responsive 'top)
  (setq highlight-indent-guides-delay 0)
  (setq highlight-indent-guides-auto-character-face-perc 7)
  :hook (prog-mode . highlight-indent-guides-mode))

;; Auto complete parentheses
(use-package
  autopair
  :ensure t
  :config (autopair-global-mode))
;; Rainbow parentheses
(use-package
  rainbow-delimiters
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))
;; Highlight parentheses
(use-package
  highlight-parentheses
  :ensure t
  :hook (prog-mode . highlight-parentheses-mode))
;; Auto complete
(use-package
  company
  :defer 1
  :ensure t
  :init
  ;; Don't convert to downcase.
  (setq-default company-dabbrev-downcase nil)
  :config (global-company-mode t)
  :bind (("C-SPC" . company-complete) :map company-active-map ("C-n" . company-select-next)
         ("C-p" . company-select-previous)))

(use-package
  format-all
  :ensure t
  :config (add-hook 'prog-mode-hook 'format-all-mode))

;; macOS
(use-package
  exec-path-from-shell
  :if (memq window-system '(mac ns))
  :ensure t
  :config (exec-path-from-shell-initialize))

(provide 'global)
;;; global.el ends here