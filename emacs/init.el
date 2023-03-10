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

;; Disable tool bar
(tool-bar-mode -1)
(menu-bar-mode -1)

;; (use-package all-the-icons
;;   :ensure t)
;;
;; (add-to-list 'load-path "~/.emacs.d/unicode-fonts/")
;; (require 'unicode-fonts)
;; (unicode-fonts-setup)

;; Fix for "Package cl is deprecated"
(require 'cl-lib)
;; (setq byte-compile-warnings '(cl-functions))

;; (global-set-key (kbd "C-c C-c") 'comment-line)
(global-set-key (kbd "C-c C-s") 'window-swap-states)

(set-default-coding-systems 'utf-8)

;; TODO done with timestamp
;; (setq org-log-done 'time)
(use-package tree-sitter :ensure t)
(global-tree-sitter-mode)
(setq tree-sitter-hl-mode t)

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

;; Powerline
;; (use-package powerline :ensure t)
;; (powerline-default-theme)
;; (powerline-raw mode-line-mule-info nil 'l)

(use-package telephone-line :ensure t)
(telephone-line-mode 1)

;; (require 'doom-modeline)
;; (doom-modeline-mode 1)
;;
;; (use-package doom-modeline
;;   :ensure t
;;   :init (doom-modeline-mode 1))

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

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("b99e334a4019a2caa71e1d6445fc346c6f074a05fcbb989800ecbe54474ae1b0" "7e377879cbd60c66b88e51fad480b3ab18d60847f31c435f15f5df18bdb18184" "a3e99dbdaa138996bb0c9c806bc3c3c6b4fd61d6973b946d750b555af8b7555b" "e3daa8f18440301f3e54f2093fe15f4fe951986a8628e98dcd781efbec7a46f2" "5f128efd37c6a87cd4ad8e8b7f2afaba425425524a68133ac0efd87291d05874" "443e2c3c4dd44510f0ea8247b438e834188dc1c6fb80785d83ad3628eadf9294" "aec7b55f2a13307a55517fdf08438863d694550565dee23181d2ebd973ebd6b8" "eca44f32ae038d7a50ce9c00693b8986f4ab625d5f2b4485e20f22c47f2634ae" "1436985fac77baf06193993d88fa7d6b358ad7d600c1e52d12e64a2f07f07176" "76ed126dd3c3b653601ec8447f28d8e71a59be07d010cd96c55794c3008df4d7" "835868dcd17131ba8b9619d14c67c127aa18b90a82438c8613586331129dda63" "234dbb732ef054b109a9e5ee5b499632c63cc24f7c2383a849815dacc1727cb6" "c7000071e9302bee62fbe0072d53063da398887115ac27470d664f9859cdd41d" "bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "9b4ae6aa7581d529e20e5e503208316c5ef4c7005be49fdb06e5d07160b67adc" "b73a23e836b3122637563ad37ae8c7533121c2ac2c8f7c87b381dd7322714cd0" "171d1ae90e46978eb9c342be6658d937a83aaa45997b1d7af7657546cae5985b" default))
 '(markdown-command "/usr/bin/pandoc")
 '(package-selected-packages
   '(evil lsp-ltex git-modes lsp-pyright lsp-grammarly markdownfmt tree-sitter-langs markdown-preview-mode octicons godoctor flycheck-golangci-lint flycheck-gometalinter git-gutter-fringe cargo-mode cargo docker docker-compose-mode git-gutter dap-cpptools dap-mode jenkinsfile-mode go-mode vimrc-mode atom-one-dark-theme rustic lsp-python-ms sed-mode blaken blacken py-autopep8 elpy wgrep atom-one-theme yaml-mode js2-refactor xref-js2 js2-mode company lsp-ui apheleia lsp-mode magit web-mode rust-mode)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

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
  (lsp-eldoc-render-all t)
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

;; optionally if you want to use debugger
(use-package dap-mode :ensure t)
(setq dap-auto-configure-features '(sessions locals controls tooltip))
(dap-mode 1)

;; The modes below are optional

(dap-ui-mode 1)
;; enables mouse hover support
(dap-tooltip-mode 1)
;; use tooltips for mouse hover
;; if it is not enabled `dap-mode' will use the minibuffer.
(tooltip-mode 1)
;; displays floating panel with debug buttons
;; requies emacs 26+
(dap-ui-controls-mode 1)

(require 'dap-utils)
(require 'dap-dlv-go)
(require 'dap-gdb-lldb)
(require 'dap-cpptools)
(add-hook 'dap-stopped-hook
          (lambda (arg) (call-interactively #'dap-hydra)))

;; (with-eval-after-load 'lsp-rust (require 'dap-cpptools))

;; Add a template specific for debugging Rust programs.
;; It is used for new projects, where I can M-x dap-edit-debug-template
(dap-register-debug-template "Rust::GDB Run Configuration"
                             (list :type "gdb"
                                   :request "launch"
                                   :name "GDB::Run"
                           :gdbpath "rust-gdb"
                                   :target nil
                                   :cwd nil))
(with-eval-after-load 'dap-mode
    (setq dap-default-terminal-kind "integrated") ;; Make sure that terminal programs open a term for I/O in an Emacs buffer
    (dap-auto-configure-mode +1))

;; (use-package dap-LANGUAGE) to load the dap adapter for your language

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
