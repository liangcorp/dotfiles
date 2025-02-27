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

(column-number-mode)

(scroll-bar-mode -1)        ; Disable visible scrollbar
(tool-bar-mode -1)          ; Disable the toolbar
(set-fringe-mode 10)        ; Give some breathing room

(menu-bar-mode -1)            ; Disable the menu bar

(setq warning-minimum-level :emergency)
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

;; Enable go-mode
(use-package go-mode
  :ensure t
  :bind (:map go-mode-map
              ("<f6>" . gofmt)
              ("C-c 6" . gofmt))
  :config
  (add-to-list 'exec-path "~/go/bin")
  (setq gofmt-command "goimports"))
(add-hook 'go-mode-hook 'display-line-numbers-mode)

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
(setq helm-move-to-line-cycle-in-source nil)

;; wgrep package for string refactoring in multiple files
(use-package wgrep :ensure t)

;; Remove trailing white space
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; (use-package evil :ensure t)
;; (evil-mode 1)

(setq-default tab-width 4)
(hl-line-mode +1)

;; (use-package gruvbox-theme
;;   :ensure t
;;   :load-path "themes"
;;   :init
;;   ;; (setq one-dark-theme-kit t)
;;   :config
;;   (load-theme 'gruvbox-dark-hard t))

(use-package atom-one-dark-theme
  :ensure t
  :load-path "themes"
  :init
  ;; (setq one-dark-theme-kit t)
  :config
  (load-theme 'atom-one-dark t))

;; (use-package apheleia
;;   :ensure t
;;   :init
;;   (apheleia-global-mode))

(use-package vimrc-mode :ensure t)
(add-to-list 'auto-mode-alist '("\\vimrc\\'" . vimrc-mode))
(add-hook 'vimrc-mode-hook 'display-line-numbers-mode)

(use-package jenkinsfile-mode :ensure t)
(add-to-list 'auto-mode-alist '("\\JenkinsFile\\'" . jenkinsfile-mode))
(add-hook 'jenkinsfile-mode-hook 'display-line-numbers-mode)

(use-package docker-compose-mode :ensure t)
(add-to-list 'auto-mode-alist '("\\Dockerfile\\'" . docker-compose-mode))
(add-hook 'docker-compose-mode-hook 'display-line-numbers-mode)

(use-package git-gutter :ensure t)
(use-package git-gutter-fringe :ensure t)
(use-package git-gutter
  :hook (prog-mode . git-gutter-mode)
  :config
  (setq git-gutter:update-interval 0.02))
(define-fringe-bitmap 'git-gutter-fr:added [224] nil nil '(center repeated))
(define-fringe-bitmap 'git-gutter-fr:modified [224] nil nil '(center repeated))
(define-fringe-bitmap 'git-gutter-fr:deleted [128 192 224 240] nil nil '(center repeated))

;; Rust mode
(use-package rust-mode
  :mode "\\.rs\\'"
  :init
  )
(require 'rust-mode)
(add-hook 'rust-mode-hook
          (lambda () (setq indent-tabs-mode nil)))
(add-hook 'rust-mode-hook #'cargo-minor-mode)
(add-hook 'rust-mode-hook #'display-line-numbers-mode)
										;(use-package rustic :ensure t)
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
(add-hook 'web-mode-hook 'display-line-numbers-mode)

;; Add hook for CSS modes that will run auto-complete-mode
;; (require 'css-mode)
;; (add-to-list 'auto-mode-alist '("\\.css\\'" . css-mode))
(add-hook 'css-mode #'auto-complete-mode)
(add-hook 'css-mode-hook 'display-line-numbers-mode)

;; C-mode that will run LSP at start
(add-hook 'c-mode-hook
          (lambda () (setq indent-tabs-mode nil)))
(add-hook 'c-mode-hook 'display-line-numbers-mode)
;; (setq c-format-on-save t)

;; C++-mode that will run LSP at start
(add-hook 'c++-mode-hook
          (lambda () (setq indent-tabs-mode nil)))
(add-hook 'c++-mode-hook 'display-line-numbers-mode)
;; (setq c-format-on-save t)


;; PYTHON support
(use-package elpy :ensure t)
(elpy-enable)
;; Enable autopep8
(use-package py-autopep8 :ensure t)
(use-package blacken :ensure t)
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)
(add-hook 'elpy-mode-hook 'display-line-numbers-mode)

(use-package yasnippet
  :ensure
  :config
  (yas-reload-all)
  (add-hook 'prog-mode-hook 'yas-minor-mode)
  (add-hook 'text-mode-hook 'yas-minor-mode))

;; mardown-mode runs on .md files by default
(use-package markdown-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
  (add-hook 'markdown-mode-hook 'display-line-numbers-mode)

  ;; yaml-mode runs on .yaml files by default
  (use-package yaml-mode :mode "\\.ya?ml\\'")
  (add-hook 'yaml-mode-hook 'display-line-numbers-mode)

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

  (setq x-select-enable-clipboard t)

  ;; Shift the selected region right if distance is postive, left if
;; negative

(defun shift-region (distance)
  (let ((mark (mark)))
    (save-excursion
      (indent-rigidly (region-beginning) (region-end) distance)
      (push-mark mark t t)
      ;; Tell the command loop not to deactivate the mark
      ;; for transient mark mode
      (setq deactivate-mark nil))))

(defun shift-right ()
  (interactive)
  (shift-region 1))

(defun shift-left ()
  (interactive)
  (shift-region -1))

;; Bind (shift-right) and (shift-left) function to your favorite keys. I use
;; the following so that Ctrl-Shift-Right Arrow moves selected text one
;; column to the right, Ctrl-Shift-Left Arrow moves selected text one
;; column to the left:

(global-set-key [C-S-right] 'shift-right)
(global-set-key [C-S-left] 'shift-left)


;;; init.el ends here
