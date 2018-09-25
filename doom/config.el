;;; private/default/config.el -*- lexical-binding: t; -*-

(setq doom-font (font-spec :family "Iosevka Term" :size 14))


;; Ivy regexp builder splitting by spaces
(setq ivy-re-builders-alist '((t . ivy--regex-plus)))
;; Other c  hoices: ivy--regex-ignore-order
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
