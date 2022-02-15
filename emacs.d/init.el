;;; package --- Summary
;;; Commentary:
;; Emacs configuration by Chen Liang

;;; Code:
;; Set up package.el to work with MELPA
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

;; Disable tool bar
(tool-bar-mode -1)

;; Git support for Emacs
(use-package magit :ensure)

;; wgrep package for string refactoring in multiple files
(use-package wgrep :ensure)

;; Support for haskell
(use-package haskell-mode :ensure)
;; Remove trailing white space
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; (use-package evil :ensure)
;; (require 'evil)
;; (evil-mode 0)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "9b4ae6aa7581d529e20e5e503208316c5ef4c7005be49fdb06e5d07160b67adc" "b73a23e836b3122637563ad37ae8c7533121c2ac2c8f7c87b381dd7322714cd0" "171d1ae90e46978eb9c342be6658d937a83aaa45997b1d7af7657546cae5985b" default))
 '(package-selected-packages
   '(haskell-mode neotree atom-one-dark-theme atom-dark-theme rustic lsp-python-ms sed-mode blaken blacken py-autopep8 elpy wgrep helm-ag atom-one-theme yaml-mode auto-complete one-theme js2-refactor xref-js2 js2-mode company flycheck lsp-ui apheleia lsp-mode flymake-aspell magit web-mode rust-mode one-themes)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setq-default tab-width 4)
;; (hl-line-mode +1)
(use-package neotree :ensure)
(global-set-key [f8] 'neotree-toggle)
(setq neo-smart-open t)
(setq projectile-switch-project-action 'neotree-projectile-action)
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

(use-package apheleia :ensure)
(apheleia-global-mode +1)

(use-package flycheck
  :ensure t
  :init (global-flycheck-mode))

;; Load auto-complete
(use-package auto-complete :ensure)

(use-package lsp-mode
  :ensure
  :commands lsp
  :custom
  ;; what to use when checking on-save. "check" is default, I prefer clippy
  (lsp-rust-analyzer-cargo-watch-command "clippy")
  (lsp-eldoc-render-all t)
  (lsp-idle-delay 0.6)
  (lsp-rust-analyzer-server-display-inlay-hints t)
  :config
  (add-hook 'lsp-mode-hook 'lsp-ui-mode)
  (add-hook 'lsp-mode-hook 'flyspell-prog-mode)
  (add-hook 'lsp-mode-hook 'auto-complete-mode)
  (add-hook 'lsp-mode-hook 'display-line-numbers-mode)
  (add-hook 'lsp-mode-hook 'hl-line-mode)
  (add-hook 'js2-mode-hook #'lsp))

(use-package lsp-ui
  :ensure
  :commands lsp-ui-mode
  :custom
  (lsp-ui-peek-always-show t)
  (lsp-ui-sideline-show-hover t)
  (lsp-ui-doc-enable t))

;; (ac-config-default)

;; Rust mode with LSP support
(use-package rust-mode :ensure)
;; (require 'rust-mode)
(add-hook 'rust-mode-hook
          (lambda () (setq indent-tabs-mode nil)))
(setq rust-format-on-save t)
(add-hook 'rust-mode-hook #'lsp)
;; (add-hook 'rust-mode-hook #'cargo-minor-mode)
(use-package rustic :ensure)

(define-key rust-mode-map (kbd "C-c C-r") 'rust-run)
(define-key rust-mode-map (kbd "C-c C-t") 'rust-test)
(define-key rust-mode-map (kbd "C-c C-c") 'rust-check)

(use-package web-mode :ensure)
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
(use-package js2-mode :ensure)
(add-hook 'js2-mode-hook #'lsp)
;; Better imenu
(add-hook 'js2-mode-hook #'js2-imenu-extras-mode)

(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(use-package js2-refactor :ensure)
;; (require 'js2-refactor)
(use-package xref-js2 :ensure)
;; (require 'xref-js2)

(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-r")
;; (define-key js2-mode-map (kbd "C-k") #'js2r-kill)

;; js-mode (which js2 is based on) binds "M-." which conflicts with xref, so
;; unbind it.
;; (define-key js-mode-map (kbd "M-.") nil)

(add-hook 'js2-mode-hook (lambda ()
 			   (add-hook 'xref-backend-functions #'xref-js2-xref-backend nil t)))

;; (use-package company :ensure)
;; (company-mode +1)

;; PYTHON support
(use-package elpy :ensure)
(elpy-enable)
;; Enable autopep8
(use-package py-autopep8 :ensure)
(use-package blacken :ensure)
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
(require 'markdown-mode)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))

;; yaml-mode runs on .yaml files by default
(use-package yaml-mode :ensure)
(add-to-list 'auto-mode-alist '("\\.yaml\\'" . yaml-mode))

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
(global-set-key (kbd "C-x C-b") 'ibuffer)
(defadvice ibuffer
  (around ibuffer-point-to-most-recent) ()
  "Open ibuffer with cursor pointed to most recent buffer name."
  (let ((recent-buffer-name (buffer-name)))
    ad-do-it
    (ibuffer-jump-to-buffer recent-buffer-name)))
(ad-activate 'ibuffer)

;;; init.el ends here
