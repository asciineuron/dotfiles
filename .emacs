(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(TeX-view-program-selection
   (quote
    (((output-dvi has-no-display-manager)
      "dvi2tty")
     ((output-dvi style-pstricks)
      "dvips and gv")
     (output-dvi "xdvi")
     (output-pdf "Okular")
     (output-html "xdg-open"))))
 '(package-selected-packages
   (quote
    (zenburn-theme auctex company rainbow-delimiters moe-theme))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Inconsolata" :foundry "PfEd" :slant normal :weight normal :height 120 :width normal)))))

;; manually added to add MELPA repository
(require 'package) ;; You might already have this line
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
                    (not (gnutls-available-p))))
       (url (concat (if no-ssl "http" "https") 
"://melpa.org/packages/")))
  (add-to-list 'package-archives (cons "melpa" url) t))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . 
"http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

;; below are manually added customizations

;; directs emacs to moe theme directory to load
(add-to-list 'custom-theme-load-path 
"~/.emacs.d/elpa/moe-theme-20170914.2111/")
(load-theme 'moe-dark t)

;; (load-theme 'zenburn t)

;; auto enables rainbow delimiters for programming modes
(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)

;; auto enables company code completion for programming modes
;; (add-hook 'prog-mode-hook #'global-company-mode)
;; auto enables company mode for all modes
(add-hook 'after-init-hook 'global-company-mode)

;; turn on semantic
(semantic-mode 1)

;; added to enable auctex/latex autocomplete in company
(require 'company-auctex)
(company-auctex-init)

;; added to help with latex
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
(add-hook 'LaTeX-mode-hook 'turn-on-reftex)
(setq reftex-plug-into-AUCTeX t)

;; enables line numbering 
(global-linum-mode t)
