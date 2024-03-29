;;; package --- Summary
;;; Commentary:
;; Emacs configuration by Chen Liang
;;; Code:
;; Set up package.el to work with MELPA
(use-package package :ensure t)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
;; (add-to-list 'package-archives '("gnu" . "https://elpa.gnu.org/packages/"))
;; (add-to-list 'package-archives '("nongnu" . "https://elpa.nongnu.org/packages/"))


(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(setq visible-bell t)
(column-number-mode)

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(set-fringe-mode 10)        ; Give some breathing room

(menu-bar-mode -1)            ; Disable the menu bar

(setq warning-minimum-level :emergency)

;; Set up the visible bell
(setq visible-bell t)

;; (use-package all-the-icons
;;   :ensure t)
;;
;; (add-to-list 'load-path "~/.emacs.d/unicode-fonts/")
;; (require 'unicode-fonts)
;; (unicode-fonts-setup)

;; Fix for "Package cl is deprecated"
(require 'cl-lib)
(setq warning-minimum-level :emergency)
;; (setq byte-compile-warnings '(cl-functions))

;; (global-set-key (kbd "C-c C-c") 'comment-line)
(global-set-key (kbd "C-c C-s") 'window-swap-states)

(set-default-coding-systems 'utf-8)

;; TODO done with timestamp
;; (setq org-log-done 'time)
;; (use-package tree-sitter :ensure t)
;; (global-tree-sitter-mode)
;; (setq tree-sitter-hl-mode t)

;; Enable go-mode
(use-package go-mode
  :ensure t
  :hook ((go-mode . lsp-deferred)
         (go-mode . company-mode)
         (go-mode . yas-minor-mode))
  :bind (:map go-mode-map
              ("<f6>" . gofmt)
              ("C-c 6" . gofmt))
  :config
  (use-package lsp-mode :ensure t)
  (setq lsp-go-analyses
        '((fieldalignment . t)
          (nilness        . t)
          (unusedwrite    . t)
          (unusedparams   . t)
          (useany         . t)
          (unusedvariable . t)))
  (add-to-list 'exec-path "~/go/bin")
  (setq gofmt-command "goimports"))

;; (require 'go-mode)
;; (add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))
;; (add-to-list 'auto-mode-alist '("\\go.mod\\'" . go-mode))
;; (add-hook 'go-mode-hook #'lsp-mode)
;;(add-hook 'before-save-hook 'gofmt-before-save)
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))
(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

;; Start LSP Mode and YASnippet mode
;; (add-hook 'go-mode-hook #'lsp-deferred)
;; (add-hook 'go-mode-hook #'yas-minor-mode)

;; Add spell check to Org mode
;; (add-hook 'org 'flycheck-mode)

(use-package flycheck :ensure t)
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Git support for Emacs
(use-package magit :ensure t)
(use-package diff-hl :ensure)

(add-hook 'magit-post-refresh-hook
          #'git-gutter:update-all-windows)

(use-package helm :ensure t)
;; (use-package helm-config :ensure t)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x C-f") #'helm-find-files)
(setq helm-locate-fuzzy-match t)
;; (require 'helm-config)
(helm-mode 1)

;; wgrep package for string refactoring in multiple files
(use-package wgrep :ensure t)

;; Remove trailing white space
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; (use-package evil :ensure t)
;; (evil-mode 1)

(setq-default tab-width 4)
(hl-line-mode +1)

;; (use-package neotree :ensure t)
;; (global-set-key [f8] 'neotree-toggle)
;; (setq neo-smart-open t)
;; (setq neo-theme (if (display-graphic-p) 'icons 'arrow))
;;
;; (setq projectile-switch-project-action 'neotree-projectile-action)
;; (defun neotree-project-dir ()
;;     "Open NeoTree using the git root."
;;     (interactive)
;;     (let ((project-dir (ffip-project-root))
;;           (file-name (buffer-file-name)))
;;       (if project-dir
;;           (progn
;;             (neotree-dir project-dir)
;;             (neotree-find file-name))
;;         (message "Could not find git project root."))))

;;   (define-key map (kbd "C-c C-p") 'neotree-project-dir)

(use-package atom-one-dark-theme
  :ensure t
  :load-path "themes"
  :init
  ;; (setq one-dark-theme-kit t)
  :config
  (load-theme 'atom-one-dark t))

(use-package apheleia
  :ensure t
  :init
  (apheleia-global-mode))

(use-package vimrc-mode :ensure t)
(add-to-list 'auto-mode-alist '("\\vimrc\\'" . vimrc-mode))

(use-package jenkinsfile-mode :ensure t)
(add-to-list 'auto-mode-alist '("\\JenkinsFile\\'" . jenkinsfile-mode))

(use-package docker-compose-mode :ensure t)
(add-to-list 'auto-mode-alist '("\\Dockerfile\\'" . docker-compose-mode))

(use-package git-gutter :ensure t)
(use-package git-gutter-fringe :ensure t)
(use-package git-gutter
  :hook (prog-mode . git-gutter-mode)
  :config
  (setq git-gutter:update-interval 0.02))
(define-fringe-bitmap 'git-gutter-fr:added [224] nil nil '(center repeated))
(define-fringe-bitmap 'git-gutter-fr:modified [224] nil nil '(center repeated))
(define-fringe-bitmap 'git-gutter-fr:deleted [128 192 224 240] nil nil '(center repeated))

(use-package lsp-mode
  :ensure t
  :bind (:map lsp-mode-map
              ("C-c d" . 'lsp-describe-thing-at-point)
              ("C-c a" . 'lsp-execute-code-action))
  :commands lsp
  :custom
  ;; what to use when checking on-save. "check" is default, I prefer clippy
  ;; (setq lsp-rust-analyzer-cargo-watch-command "clippy")
  (lsp-rust-analyzer-cargo-watch-command "clippy")
  ;; (lsp-eldoc-render-all t)
  (lsp-idle-delay 0.6)
  (lsp-rust-analyzer-server-display-inlay-hints t)
  :config
  (add-hook 'lsp-mode-hook 'lsp-ui-mode)
  (add-hook 'lsp-mode-hook 'flyspell-prog-mode)
  (add-hook 'lsp-mode-hook 'company-mode)
  (add-hook 'lsp-mode-hook 'display-line-numbers-mode)
  (add-hook 'lsp-mode-hook 'hl-line-mode)
  (define-key lsp-mode-map (kbd "C-c l") lsp-command-map)
  (setq lsp-modeline-diagnostics-scope :workspace))
;; (add-hook 'lsp-mode-hook 'display-fill-column-indicator-mode)

(use-package lsp-ltex
  :ensure t
  :hook (text-mode . (lambda ()
                       (require 'lsp-ltex)
                       (lsp)))  ; or lsp-deferred
  :init
  (setq lsp-ltex-version "15.2.0"))  ; make sure you have set this, see below


(use-package lsp-ui
  :ensure
  :commands lsp-ui-mode
  :custom
  (lsp-ui-peek-always-show t)
  ;; (lsp-ui-sideline-show-hover t)
  (lsp-ui-doc-enable t))

;; (ac-config-default)

;; Rust mode with LSP support
(use-package rust-mode
  :mode "\\.rs\\'"
  :init (setq rust-format-on-save t))
;; (require 'rust-mode)
(add-hook 'rust-mode-hook
          (lambda () (setq indent-tabs-mode nil)))
(add-hook 'rust-mode-hook #'lsp)
(add-hook 'rust-mode-hook #'cargo-minor-mode)
(use-package rustic :ensure t)
(use-package cargo :ensure t)

(define-key rust-mode-map (kbd "C-c C-r") 'rust-run)
(define-key rust-mode-map (kbd "C-c C-t") 'rust-test)
(define-key rust-mode-map (kbd "C-c C-c") 'rust-check)

(use-package web-mode :ensure t)
;; (require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))

;; Add hook for CSS modes that will run auto-complete-mode
;; (require 'css-mode)
;; (add-to-list 'auto-mode-alist '("\\.css\\'" . css-mode))
(add-hook 'css-mode #'auto-complete-mode)

;; C-mode that will run LSP at start
(add-hook 'c-mode-hook #'lsp)
(add-hook 'c-mode-hook
          (lambda () (setq indent-tabs-mode nil)))
;; (setq c-format-on-save t)

;; C++-mode that will run LSP at start
(add-hook 'c++-mode-hook #'lsp)
(add-hook 'c++-mode-hook
          (lambda () (setq indent-tabs-mode nil)))
;; (setq c-format-on-save t)

;; Javascript mode will run LSP at start
(use-package js2-refactor :ensure t)
(use-package xref-js2 :ensure t)

(use-package js2-mode
  :ensure t
  :hook
  (js2-mode . (lambda ()
				(require 'lsp)
				(lsp-deferred)
				(add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t))))

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))
(add-to-list 'auto-mode-alist '("\\.mjs\\'" . js2-mode))
(use-package js2-mode :ensure)
(add-hook 'js2-mode-hook #'lsp)
;; (add-hook 'js2-mode-hook
;; 		  (lambda () (flycheck-add-next-checker 'javascript-eslint 'lsp-ui)))

;; Better imenu
(add-hook 'js2-mode-hook #'js2-imenu-extras-mode)
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-r")
;; (define-key js2-mode-map (kbd "C-k") #'js2r-kill)

;; js-mode (which js2 is based on) binds "M-." which conflicts with xref, so
;; unbind it.
;; (define-key js-mode-map (kbd "M-.") nil)

;; (add-hook 'js2-mode-hook (lambda ()
;; 			   (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))

(use-package company :ensure t)
(company-mode +1)
(setq company-idle-delay 0)
(setq company-minimum-prefix-length 1)

;; PYTHON support
(use-package elpy :ensure t)
(elpy-enable)
;; Enable autopep8
(use-package py-autopep8 :ensure t)
(use-package blacken :ensure t)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
;; (add-to-list 'auto-mode-alist '("\\.py\\'" . elpy-mode))
;; (use-package lsp-python-ms
;;   :ensure t
;;   :init (setq lsp-python-ms-auto-install-server t)
;;   :hook (python-mode . (lambda ()
;;                           (require 'lsp-python-ms)
;;                           (lsp))))  ; or lsp-deferred

;; ELISP mode hooks company-mode
;; (add-hook 'emacs-lisp-mode #'company-mode)

(use-package yasnippet
  :ensure
  :config
  (yas-reload-all)
  (add-hook 'prog-mode-hook 'yas-minor-mode)
  (add-hook 'text-mode-hook 'yas-minor-mode))

;; mardown-mode runs on .md files by default
(use-package markdown-mode
  :hook (markdown-mode . lsp)
  :config
  (require 'lsp-marksman))
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; yaml-mode runs on .yaml files by default
(use-package yaml-mode :mode "\\.ya?ml\\'")

;; turn on semantic
;; (semantic-mode 1)

;; Allow moving of a line or a block with M-Up and M-Down
(defun move-region (start end n)
  "Move the current region up or down by N lines from START to END."
  (interactive "r\np")
  (let ((line-text (delete-and-extract-region start end)))
    (forward-line n)
    (let ((start (point)))
      (insert line-text)
      (setq deactivate-mark nil)
      (set-mark start))))

(defun move-region-up (start end n)
  "Move the current line up by N lines from START to END."
  (interactive "r\np")
  (move-region start end (if (null n) -1 (- n))))

(defun move-region-down (start end n)
  "Move the current line down by N lines from START to END."
  (interactive "r\np")
  (move-region start end (if (null n) 1 n)))

(global-set-key (kbd "M-<up>") 'move-region-up)
(global-set-key (kbd "M-<down>") 'move-region-down)

;; Ensure ibuffer opens with point at the current buffer's entry.
;; (global-set-key (kbd "C-x C-b") 'ibuffer)
;;
;; (defadvice ibuffer
;;   (around ibuffer-point-to-most-recent)
;;   "Open ibuffer with cursor pointed to most recent buffer name."
;;   (let ((recent-buffer-name (buffer-name)))
;;     ad-do-it
;;     (ibuffer-jump-to-buffer recent-buffer-name)))
;; (ad-activate 'ibuffer)


;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(blacken py-autopep8 elpy company xref-js2 js2-refactor web-mode cargo rustic lsp-ui lsp-ltex lsp-mode git-gutter-fringe git-gutter docker-compose-mode jenkinsfile-mode vimrc-mode apheleia atom-one-dark-theme wgrep helm diff-hl magit flycheck go-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
