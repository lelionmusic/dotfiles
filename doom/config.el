;;; private/default/config.el -*- lexical-binding: t; -*-

(setq doom-font (font-spec :family "Iosevka Term" :size 14))

;; Keybindings
  
;; (global-set-key [s-return] 'spacemacs/evil-insert-line-below)
;;     (global-set-key [C-return] 'spacemacs/evil-insert-line-above)

;; Ivy regexp builder splitting by spaces
(setq ivy-re-builders-alist '((t . ivy--regex-plus)))
;; Other choices: ivy--regex-ignore-order
;;                ivy--regex-fuzzy

(map! :n "C-h" #'evil-window-left
      :n "C-j" #'evil-window-down
      :n "C-k" #'evil-window-up
      :n "C-l" #'evil-window-right)
