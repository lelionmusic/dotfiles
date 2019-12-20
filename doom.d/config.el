;;; private/default/config.el -*- lexical-binding: t; -*-

;; Font
(let ((main-font (font-spec :family "PragmataPro" :size 14))
      (fallback-font1 (font-spec :family "Iosevka" :size 14))
      (fallback-font2 (font-spec :family "Iosevka Term" :size 14)))
  (setq doom-font     (if (find-font main-font)
                          main-font
                        (if (find-font fallback-font1)
                            fallback-font1
                          fallback-font2))))

(setq user-full-name    "Geir Olav Alsvik"
      user-mail-address "goa95@protonmail.com"

      ;; Theme
      doom-theme 'doom-moonlight

      ;; o and O from a commented line will not continue comments
      +evil-want-o/O-to-continue-comments nil
      ivy-re-builders-alist '((t . ivy--regex-plus))

      lsp-signature-auto-activate nil
      lsp-enable-symbol-highlighting nil

      ;; Use C-n to trigger on-demand completion list
      company-idle-delay nil
      company-box-doc-delay nil

      ;; Org-mode
      org-ellipsis " ▼ "
      org-directory (expand-file-name "~/org/")
      org-hide-emphasis-markers t
      org-bullets-bullet-list '("◆" "◈" "◇"))

;; Keybindings
(map! :en "C-h" #'evil-window-left
      :en "C-j" #'evil-window-down
      :en "C-k" #'evil-window-up
      :en "C-l" #'evil-window-right
      :en "M-s" #'save-buffer
      :en "M-w" #'delete-window
      :en "M-a" #'mark-whole-buffer
      :i  "C-n" #'+company/complete

      (:after ivy
        :map ivy-minibuffer-map
        "C-h" #'ivy-backward-kill-word
        "RET" #'ivy-alt-done))


;; didn't work TODO
;; (defun org-summary-todo (n-done n-not-done)
;;   "Switch entry to DONE when all subentries are done, to TODO otherwise."
;;   (let (org-log-done org-log-states)   ; turn off logging
;;     (org-todo (if (= n-not-done 0) "DONE" "TODO"))))
;; (add-hook 'org-after-todo-statistics-hook 'org-summary-todo)
