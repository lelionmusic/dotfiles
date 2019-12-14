;;; init.el -*- lexical-binding: t; -*-
;; Copy me to ~/.doom.d/init.el or ~/.config/doom/init.el, then edit me!

(doom! :input
       ;;japanese

       :completion
       (company          ; the ultimate code completion backend
        +childframe)
       (ivy              ; a search engine for love and life
        +fuzzy           ; enable fuzzy search backend for ivy
        +icons)

       :ui
       doom              ; what makes DOOM look the way it does
       doom-dashboard    ; a nifty splash screen for Emacs
       modeline          ; a snazzy Atom-inspired mode-line
       hl-todo           ; highlight TODO/FIXME/NOTE tags
       modeline          ; snazzy, Atom-inspired modeline, plus API
       nav-flash         ; blink the current line after jumping
       indent-guides
       ophints           ; highlight the region an action operates on
       treemacs
       (popup            ; tame sudden yet inevitable temporary windows
        +all             ; catch all popups that start with an asterix
        +defaults)       ; default popup rules
       ;;(pretty-code      ; replace bits of code with pretty symbols
       ;; +iosevka)
       ;; tabs
       unicode           ; extended unicode support for various languages
       vc-gutter         ; vcs diff in the fringe
       workspaces


       :editor
       (evil +everywhere); come to the dark side, we have cookies
       format            ; automated prettiness
       file-templates    ; auto-snippets for empty files
       fold
       multiple-cursors  ; editing in many places at once
       rotate-text       ; cycle region at point between text candidates
       snippets          ; my elves. They type so I don't have t

       :lang
      ;crystal           ; ruby at the speed of c
      ;csharp            ; unity, .NET, and mono shenanigans
       data              ; config/data formats
      ;erlang            ; an elegant language for a more civilized age
      ;elixir            ; erlang done right
      ;elm               ; care for a cup of TEA?
       emacs-lisp        ; drown in parentheses
      ;ess               ; emacs speaks statistics
      ;go                ; the hipster dialect
      ;(haskell +intero) ; a language that's lazier than I am
      ;hy                ; readability of scheme w/ speed of python
      ;idris             ;
      (java +meghanada) ; the poster child for carpal tunnel syndrome
      (javascript +lsp)        ; all(hope(abandon(ye(who(enter(here))))))
      ;julia             ; a better, faster MATLAB
      latex              ; writing papers in Emacs has never been so fun
      ;ledger            ; an accounting system in Emacs
      ;lua               ; one-based indices? one-based indices
       markdown          ; writing docs for people to ignore
      ;nim               ; python + lisp at the speed of c
      ;nix               ; I hereby declare "nix geht mehr!"
      ;ocaml             ; an objective camel
       (org              ; organize your plain life in plain text
        +dragndrop
        +ipython
        +pandoc
        +present)        ; Emacs for presentations
      ;perl              ; write code no one else can comprehend
      ;php               ; perl's insecure younger brother
      ;plantuml          ; diagrams for confusing people more
      ;purescript        ; javascript, but functional
      (python +lsp)            ; beautiful is better than ugly
      ;qt                ; the 'cutest' gui framework ever
      ;racket            ; a DSL for DSLs
      ;rest              ; Emacs as a REST client
      ;ruby              ; 1.step do {|i| p "Ruby is #{i.even? ? 'love' : 'life'}"}
      (rust +lsp)              ; Fe2O3.unwrap().unwrap().unwrap().unwrap()
      ;scala             ; java, but good
      sh                 ; she sells (ba|z|fi)sh shells on the C xor
      ;solidity          ; do you need a blockchain? No.
      ;swift             ; who asked for emoji variables?
      (web +lsp)                ; the tubes

      :emacs
      dired
      electric
      ibuffer
      vc

      :term
      eshell

      :tools
      magit
      lsp
      (lookup +docsets)
      flycheck
      (eval +overlay)
      pdf
      rgb

       ;; Applications are complex and opinionated modules that transform Emacs
       ;; toward a specific purpose. They may have additional dependencies and
       ;; should be loaded late.
       :app
      ;(email +gmail)    ; emacs as an email client
      ;irc               ; how neckbeards socialize
      ;(rss +org)        ; emacs as an RSS reader
      ;twitter           ; twitter client https://twitter.com/vnought
      write            ; emacs as a word processor (latex + org + markdown)
      ; +wordnut         ; wordnet (wn) search
      ; +langtool)       ; a proofreader (grammar/style check) for Emacs

       :collab
      ;floobits          ; peer programming for a price
      ;impatient-mode    ; show off code over HTTP

       :config
       ;; For literate config users. This will tangle+compile a config.org
       ;; literate config in your `doom-private-dir' whenever it changes.
      ;literate

       ;; The default module sets reasonable defaults for Emacs. It also
       ;; provides a Spacemacs-inspired keybinding scheme, a custom yasnippet
       ;; library, and additional ex commands for evil-mode. Use it as a
       ;; reference for your own modules.
       (default +bindings +evil-commands))
