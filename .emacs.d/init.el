;;disable splash screen and startup message ====================================
(setq inhibit-startup-message t) 
(setq initial-scratch-message nil)
(setq package-enable-at-startup nil)
;; bootstrap straight.el so I can always have the packages I want ==============
(defvar bootstrap-version)
(let ((bootstrap-file
        (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
      (url-retrieve-synchronously
        "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
        'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))
;; package installmatic function ===============================================
(defun installmatic (pkglist)
  (while pkglist
         (straight-use-package (car pkglist))
         (setq pkglist (cdr pkglist))))
;; list of packages I want ====================================================
(setq pkgs '(
             use-package
             vlf
             evil
             lispy
             lispyville
             molokai-theme
             racket-mode
             undo-fu
             undo-fu-session
             evil-collection
    ;spacemacs-theme
             modus-themes
             ;org-mode
             spaceline
             nyan-mode
             doom-modeline
             evil-surround
             sly company))
;; install em
(installmatic pkgs)
(xterm-mouse-mode 1)
(when window-system (set-frame-size (selected-frame) 80 28))
;; configs =====================================================================
;; setup sly
;; this is how we'd install the github version. Pretty slick.
;;(straight-use-package
;; '(sly :type git :host github :repo "joaotavora/sly"))
;; config it
(require 'sly-autoloads)
;; set sbcl for slime or sly lisp development
(setq inferior-lisp-program "ros run")
(setq sly-default-lisp 'roswell)
;;(setq ros-config (concat user-emacs-directory
;;                                  "ros-conf.lisp"))
;; setup company
(global-company-mode)
(define-key company-mode-map (kbd "<tab>") 'company-complete)
;; make python editing nicer
;;(elpy-enable) ;;disabling; makes everything super slow.
;; setup evil
(setq evil-want-keybinding nil)
(setq evil-want-integration t) ;; This is optional since it's already set to t by default.
(require 'evil)
(evil-mode 1)
(evil-collection-init)
(global-evil-surround-mode 1)
(setq evil-undo-system 'undo-fu)
(undo-fu-session-global-mode) ;; for newer versions of emacs
;(global-undo-fu-session-mode)
(define-key evil-normal-state-map "u" 'undo-fu-only-undo)
(define-key evil-normal-state-map (kbd "C-r") 'undo-fu-only-redo)
;(define-key evil-normal-state-map "u" 'undo-tree-undo)
;(define-key evil-normal-state-map (kbd "C-r") 'undo-tree-redo)
;(global-undo-tree-mode)
;(setq undo-tree-auto-save-history t)
;; (add-hook 'emacs-lisp-mode-hook (lambda () (lispy-mode 1)))
;(setq undo-tree-history-directory-alist '(("." . "~/.emacs.d/undo")))
(setq undo-limit 6710886400) ;; 64mb.
(setq undo-strong-limit 100663296) ;; 96mb.
(setq undo-outer-limit 1006632960) ;; 96
(tool-bar-mode -1) ; To disable the toolbar, use the following line:
(fset 'yes-or-no-p 'y-or-n-p)    ; don't ask to spell out "yes"
(show-paren-mode 1)
(setq backup-directory-alist `(("." . "~/.saves")))
;; Theming =====================================================================
(require 'spaceline-config)
(spaceline-emacs-theme)
;(require 'doom-modeline)
;(doom-modeline-mode 1)
;;(load-theme 'modus-operandi t)
(load-theme 'modus-vivendi t)
;(load-theme 'material t)
;(nyan-bar-length 10)
;(nyan-mode +1)
;;(load-theme 'spacemacs-dark t)
(set-frame-font "JetBrains Mono 13" nil t)
;;(load-theme 'molokai t)
;; custom functions ============================================================
(defun codex (&optional b e) 
  (interactive "r")
  (shell-command-on-region b e "codex.py" nil nil))
;; custom evil keybinds ========================================================
(define-key evil-normal-state-map "Q" "@@")
;; user customization ==========================================================
