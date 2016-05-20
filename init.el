(put 'upcase-region 'disabled nil)
;; AUTOMATED PACKAGE MANAGEMENT
;; List all desired packages here
(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)
(defvar required-packages '(org-journal git-auto-commit-mode auto-complete linum-relative sublime-themes fill-column-indicator color-theme-sanityinc-tomorrow smart-mode-line evil-easymotion evil-org evil-smartparens evil-tabs evil org-download org-pomodoro smartparens) "list of packages to install at launch")

(require 'cl)
; method to check if all packages are installed
(defun packages-installed-p ()
  (loop for p in required-packages
        when (not (package-installed-p p)) do (return nil)
        finally (return t)))

; if not all packages are installed, check one by one and install the
; missing ones.
(unless (packages-installed-p)
  ; check for new packages (package versions)
  (message "%s" "Emacs is now refreshing its package database...")
  (package-refresh-contents)
  (message "%s" " done.")
  ; install the missing packages
  (dolist (p required-packages)
    (when (not (package-installed-p p))
      (package-install p))))

(require 'color-theme-sanityinc-tomorrow)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (sanityinc-tomorrow-night)))
 '(custom-safe-themes
   (quote
    ("06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "b04425cc726711a6c91e8ebc20cf5a3927160681941e06bc7900a5a5bfe1a77f" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" default)))
 '(org-agenda-files
   (quote
    ("~/Sync/org/journal.org" "~/Sync/org/personal.org" "~/Sync/org/journal/")))
 '(package-selected-packages
   (quote
    (smart-mode-line-powerline-theme org-download evil evil-easymotion))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; evil mode!!!
(require 'evil)
(evil-mode 1)
;; Make movement keys work like they should
(define-key evil-normal-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-normal-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-next-line>") 'evil-next-visual-line)
(define-key evil-motion-state-map (kbd "<remap> <evil-previous-line>") 'evil-previous-visual-line)
; Make horizontal movement cross lines
(setq-default evil-cross-lines t)

;; org-mode
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-directory "~/Sync/org/")
(setq org-log-done 'time)

;; org-download
(require 'org-download)
(setq-default org-download-image-dir "~/Sync/org/images")

;; org-pomodoro
(require 'org-pomodoro)
(global-set-key (kbd "C-c p") 'org-pomodoro)

;; Enable auto-complete
(ac-config-default)

;; org-journal
(require 'org-journal)
(setq org-journal-file-format "%Y%m%d.org")
(setq org-journal-dir "~/Sync/org/journal/")

(setq org-journal-time-prefix "* ")
(setq org-journal-time-format "<%Y\-%m\-%d %a %H:%M> ")

;; Column fixes
(setq-default fill-column 80)
(setq column-number-mode t)

;; Startup stuff
(setq line-move-visual t)
(setq visual-line-mode t)
(setq inhibit-splash-screen t)
(setq org-startup-indented t)
