;;; private/default/config.el -*- lexical-binding: t; -*-

;; Font
(setq doom-font (font-spec :family "Iosevka Term"
                           :slant 'italic'
                           ;; :weight 'bold'
                           :size 14))
(setq doom-big-font (font-spec :family "Iosevka Term"
                           :slant 'italic'
                           ;; :weight 'bold'
                           :size 24))

;; Theme
;; (setq doom-theme 'doom-nord)

;; Tab and go: make it behave more like YCM
(company-tng-configure-default)

;; o and O from a commented line will not continue comments
(setq +evil-want-o/O-to-continue-comments nil)

;; Ivy regexp builder splitting by spaces
(setq ivy-re-builders-alist '((t . ivy--regex-plus)))
;; Other choices: ivy--regex-ignore-order
;;                ivy--regex-fuzzy

;; Keybindings
(map! :en "C-h" #'evil-window-left
      :en "C-j" #'evil-window-down
      :en "C-k" #'evil-window-up
      :en "C-l" #'evil-window-right

      (:after ivy
        :map ivy-minibuffer-map
        "C-h" #'ivy-backward-kill-word
        "RET" #'ivy-alt-done)
      )

;; TODO
;; evil-comment

;; TODO (global-set-key [s-return] 'spacemacs/evil-insert-line-below)
;;      (global-set-key [C-return] 'spacemacs/evil-insert-line-above)
