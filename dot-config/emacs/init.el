(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(package-initialize)

(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)
(display-line-numbers-mode)
(setq display-line-numbers 'relative)

(setq-default tab-width 2)
(progn
  (setq-default indent-tabs-mode nil))
(defun insert-tab-char ()
  "Insert tab char. (ASCII 9, \t)"
  (interactive)
  (insert "\t"))
(global-set-key (kbd "TAB") 'insert-tab-char)

(set-face-attribute 'default nil :height 100)
(set-default 'truncate-lines t)

;; load theme
(load-theme 'monokai t)

;; load use-package
(eval-when-compile
  (add-to-list 'load-path "~/.config/emacs/elpa/use-package-20210207.1926")
  (require 'use-package))

;; REPL
(setq inferior-lisp-program "sbcl")
(use-package paredit
  :ensure t
  :init	(autoload 'enable-paredit-mode "paredit" "Turn on pseudo-structural editing of Lisp code." t)
  			(add-hook 'emacs-lisp-mode-hook #'enable-paredit-mode)
      	(add-hook 'lisp-mode-hook				#'enable-paredit-mode)
				(add-hook 'slime-repl-mode-hook (lambda () (paredit-mode +1))))
(add-hook 'emacs-lisp-mode-hook					#'rainbow-delimiters-mode)
(add-hook 'lisp-mode-hook								#'rainbow-delimiters-mode)

;; undo-tree
(global-undo-tree-mode)

;; evil
(use-package evil
  :ensure t
  :init (setq evil-want-keybinding nil)
  :config (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :config (evil-collection-init))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(electric-indent-mode nil)
 '(electric-pair-mode t)
 '(package-selected-packages
   '(## gnugo rainbow-delimiters evil-nerd-commenter lua-mode paredit undo-tree evil-collection use-package monokai-theme evil))
 '(show-paren-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; keybind
(evil-set-leader 'normal (kbd "SPC"))
(evil-define-key 'normal 'global
  (kbd "<leader>u")		'undo-tree-visualize
  (kbd "<leader>s")		'load-file
  (kbd "<leader>rr")	'slime
  (kbd "<leader>pI")	'package-install
  (kbd "<leader>pU")	'package-refresh-contents)
(evil-define-key nil evil-normal-state-map
  "-" 								'dired
  "u" 								'undo-tree-undo
  "gcc"								'evilnc-comment-or-uncomment-lines
  (kbd "C-r") 				'undo-tree-redo)
(evil-define-key nil evil-insert-state-map
  (kbd "C-u") 				'delete-region)
(evilnc-default-hotkeys nil t)

;; file modes
(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lus" . lua-mode))
