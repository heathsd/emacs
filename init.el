(put 'upcase-region 'disabled nil)

(require 'package)
(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (wheatgrass)))
 '(org-agenda-files nil)
 '(package-selected-packages (quote (org-journal evil evil-easymotion evil-tutor))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(require 'evil)
(evil-mode 1)

;; org-mode stuffs
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cc" 'org-capture)
(global-set-key "\C-cb" 'org-iswitchb)
(setq org-directory "C:\\users\\heath\\Sync\\org\\")
;; org-journal
(require 'org-journal)
(setq org-journal-dir "C:\\users\\heath\\Sync\\org\\")
(setq org-journal-file-format "journal.org")
(setq org-journal-date-format "%Y\n** %m\n*** %A, %d")
(setq org-journal-date-prefix "* ")
(setq org-journal-time-format "%R ")
(setq org-journal-time-prefix "**** ")
(setq org-journal-hide-entries-p t)
(setq org-agenda-include-diary t)
;; org-mobile
(setq org-mobile-directory "C:\\users\\heath\\Sync\\org\\mobileorg\\")
(setq org-mobile-inbox-for-pull "C:\\users\\heath\\Sync\\org\\inbox.org")
(setq org-mobile-files "C:\\users\\heath\\Sync\\org\\")
(setq org-mobile-checksum-binary "C:\\users\\heath\\Sync\\apps\\sha1sum.exe")
