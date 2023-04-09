(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(wombat))
 '(custom-safe-themes
   '("57e3f215bef8784157991c4957965aa31bac935aca011b29d7d8e113a652b693" default))
 '(global-display-line-numbers-mode t)
 '(package-selected-packages
   '(sml-mode unicode-math-input haskell-mode neotree afternoon-theme melancholy-theme evil))
 '(scroll-bar-mode nil)
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "mononoki" :foundry "UKWN" :slant normal :weight normal :height 90 :width normal)))))

(tool-bar-mode -1)
(xterm-mouse-mode)
(setq inhibit-startup-screen t)
(set-frame-parameter (selected-frame) 'alpha '(98 98))

(setq evil-want-C-u-scroll t)
(require 'evil)
(evil-mode 1)

; I prefer cmd key for meta
(setq mac-option-key-is-meta nil
      mac-command-key-is-meta t
      mac-command-modifier 'meta
      mac-option-modifier 'none)

(define-key key-translation-map (kbd "C-<mouse-3>") (kbd "C-<mouse-2>"))

(load-file (let ((coding-system-for-read 'utf-8))
                (shell-command-to-string "agda-mode locate")))

(setq-default indent-tabs-mode nil)

; https://github.com/astoff/unicode-math-input.el/tree/master
(setq unicode-math-input-extra-symbols
      '(("iff" . #x02194)
        ("implies" . #x02192)
        ("from" . #x02190)
       ))

; we hate backup in 2023
(setq make-backup-files nil)

(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))

