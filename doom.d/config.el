;;; private/default/config.el -*- lexical-binding: t; -*-

;; Font
(setq doom-font (font-spec :family "Iosevka Term"
                           ;; :slant 'italic'
                           ;; :weight 'bold'
                           :size 14))
(setq doom-big-font (font-spec :family "Iosevka Term"
                           ;; :slant 'italic'
                           ;; :weight 'bold'
                           :size 24))

;; Theme
(setq doom-theme 'doom-city-lights)

;; Tab and go: make it behave more like YCM
;; (company-tng-configure-default)

;; o and O from a commented line will not continue comments
(setq +evil-want-o/O-to-continue-comments nil)

;; Ivy regexp builder splitting by spaces
(setq ivy-re-builders-alist '((t . ivy--regex-fuzzy)))
;; Other choices: ivy--regex-ignore-order
;;                ivy--regex-fuzzy
;;                ivy--regex-plus

;; Keybindings
(map! :en "C-h" #'evil-window-left
      :en "C-j" #'evil-window-down
      :en "C-k" #'evil-window-up
      :en "C-l" #'evil-window-right
      :en "M-s" #'save-buffer
      :en "M-w" #'delete-window
      :en "M-a" #'mark-whole-buffer

      (:after ivy
        :map ivy-minibuffer-map
        "C-h" #'ivy-backward-kill-word
        "RET" #'ivy-alt-done)
      )

;; TODO (global-set-key [s-return] 'spacemacs/evil-insert-line-below)
;;      (global-set-key [C-return] 'spacemacs/evil-insert-line-above)

;; Org-mode
(setq org-ellipsis " ▼ "
      org-directory (expand-file-name "~/org/")
      ;; org-agenda-files (list org-directory)
      org-hide-emphasis-markers t
      org-bullets-bullet-list '("◆" "◈" "◇")
      )                         

;; didn't work
;; (defun org-summary-todo (n-done n-not-done)
;;   "Switch entry to DONE when all subentries are done, to TODO otherwise."
;;   (let (org-log-done org-log-states)   ; turn off logging
;;     (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
;; (add-hook 'org-after-todo-statistics-hook 'org-summary-todo)
;;
